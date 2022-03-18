from django.shortcuts import render
from django.views.generic.list import ListView
from django.views.generic.edit import UpdateView
from posts.models import Post
from django.db.models import Q, Count, Case, When


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
    pass
