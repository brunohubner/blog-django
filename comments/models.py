from django.utils import timezone
from django.db import models
from django.contrib.auth.models import User
from posts.models import Post


class Comment(models.Model):
    name = models.CharField(max_length=255)
    email = models.EmailField()
    comment = models.TextField()
    post = models.ForeignKey(Post, on_delete=models.CASCADE)
    user = models.ForeignKey(User, on_delete=models.DO_NOTHING)
    publicated = models.BooleanField(default=False)
    created_at = models.DateTimeField(default=timezone.now)
