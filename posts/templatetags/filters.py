from django import template

register = template.Library()


@register.filter(name='pluralize_comment')
def pluralize_comment(comments_count):
    try:
        comments_count = int(comments_count)
        if comments_count == 0:
            return f'Nenhum comentário'
        if comments_count == 1:
            return f'{comments_count} comentário'
        return f'{comments_count} commentários'
    except:
        return f'{comments_count} commentário(s)'
