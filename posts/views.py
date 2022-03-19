from comments.models import Comment
from django.shortcuts import redirect
from django.views.generic.list import ListView
from django.views.generic.edit import UpdateView
from comments.forms import FormComment
from posts.models import Post
from django.db.models import Q, Count, Case, When
from django.contrib import messages


class PostIndex(ListView):
    model = Post
    template_name = 'posts/index.html'
    paginate_by = 6
    context_object_name = 'posts'

    def get_queryset(self):
        qs = super().get_queryset()
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


class PostDetails(UpdateView):
    template_name = 'posts/post_details.html'
    model = Post
    form_class = FormComment
    context_object_name = 'post'

    def form_valid(self, form):
        post = self.get_object()
        comment = Comment(**form.cleaned_data)
        comment.post = post

        if self.request.user.is_authenticated:
            comment.user = self.request.user

        comment.save()
        messages.success(self.request, 'Comentário enviado com sucesso.')
        return redirect('post_details', pk=post.id)
