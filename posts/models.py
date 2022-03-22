from django.db import models
from django.utils import timezone
from django.contrib.auth.models import User
from categories.models import Category
from PIL import Image
from django.conf import settings
from pathlib import Path


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

    def save(self, *args, **kwargs):
        super().save(*args, **kwargs)
        if self.image:
            self.resize_image(self.image.name, 800)

    @staticmethod
    def resize_image(image_name, new_width):
        image_path = Path(settings.MEDIA_ROOT, image_name)
        image = Image.open(image_path)
        width, height = image.size
        new_height = round(new_width * height / width)
        if width <= new_width:
            image.close()
            return
        new_image = image.resize((new_width, new_height), Image.ANTIALIAS)
        new_image.save(image_path, optimize=True, quality=60)
        new_image.close()

    def __str__(self) -> str:
        return self.title
