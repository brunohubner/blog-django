from .models import Comment
from django.contrib import admin


class CommentAdmin(admin.ModelAdmin):
    list_display = ('id', 'name', 'email', 'post', 'created_at', 'publicated',)
    list_editable = ('publicated',)
    list_display_links = ('id', 'name',)


admin.site.register(Comment, CommentAdmin)
