from django.db import models
from django.utils import timezone
from django.contrib.auth.models import User
from categories.models import Category


class Post(models.Model):
    title = models.CharField(max_length=255)
    author = models.ForeignKey(User, on_delete=models.DO_NOTHING)
    content = models.TextField()
    excerpt = models.TextField()
    category = models.ForeignKey(
        Category, on_delete=models.DO_NOTHING, blank=True, null=True)
    image = models.ImageField(
        upload_to="post_img/%Y/%m/%d", blank=True, null=True)
    publicated = models.BooleanField(default=False)
    created_at = models.DateTimeField(default=timezone.now)

    def __str__(self) -> str:
        return self.title
