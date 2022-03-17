from django.contrib import admin
from django_summernote.admin import SummernoteModelAdmin
from posts.models import Post


class PostAdmin(SummernoteModelAdmin):
    list_display = ('id', 'title', 'author', 'category',
                    'created_at', 'publicated',)
    list_editable = ('publicated',)
    list_display_links = ('id', 'title',)
    sumernote_fields = ('content',)


admin.site.register(Post, PostAdmin)
