from comments.models import Comment
from django.shortcuts import redirect, get_object_or_404, render
from django.views.generic.list import ListView
from comments.forms import FormComment
from posts.models import Post
from django.db.models import Q, Count, Case, When
from django.contrib import messages
from django.views import View
import environ

# Initialise environment variables
env = environ.Env()
environ.Env.read_env()


class PostIndex(ListView):
    model = Post
    template_name = 'posts/index.html'
    paginate_by = 6
    context_object_name = 'posts'

    def get_queryset(self):
        qs = super().get_queryset()
        qs = qs.select_related('category')
        qs = qs.order_by('-id').filter(publicated=True)
        qs = qs.annotate(
            commnents_count=Count(
                Case(When(comment__publicated=True, then=1))
            )
        )
        return qs


class PostSearch(PostIndex):
    template_name = 'posts/post_search.html'

    def get_queryset(self):
        qs = super().get_queryset()
        search = self.request.GET.get('q')
        if not search:
            return qs
        qs = qs.filter(
            Q(title__icontains=search) |
            Q(author__first_name__iexact=search) |
            Q(content__icontains=search) |
            Q(excerpt__icontains=search) |
            Q(category__name__iexact=search)
        )
        return qs


class PostCategory(PostIndex):
    template_name = 'posts/post_category.html'

    def get_queryset(self):
        qs = super().get_queryset()
        category = self.kwargs.get('category', None)
        if not category:
            return qs
        qs = qs.filter(category__name__iexact=category)
        return qs


class PostDetails(View):
    template_name = 'posts/post_details.html'

    def setup(self, request, *args, **kwargs):
        super().setup(request, *args, **kwargs)
        pk = self.kwargs.get('pk')
        post = get_object_or_404(Post, pk=pk, publicated=True)
        comments = Comment.objects.filter(publicated=True, post=post.id)
        form = FormComment(request.POST or None)

        GOOGLE_RECAPTCHA_V2_SITE_KEY = env('GOOGLE_RECAPTCHA_V2_SITE_KEY')

        self.context = {
            'post': post,
            'comments': comments,
            'form': form,
            'GOOGLE_RECAPTCHA_V2_SITE_KEY': GOOGLE_RECAPTCHA_V2_SITE_KEY
        }

    def get(self, request, *args, **kwargs):
        return render(request, self.template_name, self.context)

    def post(self, request, *args, **kwargs):
        form = self.context['form']
        if not form.is_valid():
            return render(request, self.template_name, self.context)
        comment = form.save(commit=False)
        if request.user.is_authenticated:
            comment.user = request.user
        comment.post = self.context['post']
        comment.save()
        messages.success(request, 'Comentário enviado para avaliação.')
        return redirect('post_details', pk=self.kwargs.get('pk'))
