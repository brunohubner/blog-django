from django.forms import ModelForm
from .models import Comment


class FormComment(ModelForm):
    def clean(self):
        data = self.cleaned_data
        name = data.get('name')
        email = data.get('email')
        comment = data.get('comment')

        if len(name) < 3 or len(name) > 45:
            self.add_error('name', 'Nome prercisa ter de 3 a 45 caracteres.')

    class Meta:
        model = Comment
        fields = ('name', 'email', 'comment',)
