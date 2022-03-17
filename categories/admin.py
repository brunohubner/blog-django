from django.contrib import admin
from categories.models import Category


class CategoryAdmin(admin.ModelAdmin):
    list_diplay = ('id', 'name')
    list_diplay_links = ('id', 'name')


admin.site.register(Category, CategoryAdmin)
