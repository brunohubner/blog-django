from django.forms import ModelForm
from .models import Comment
import requests
import environ

# Initialise environment variables
env = environ.Env()
environ.Env.read_env()


class FormComment(ModelForm):
    def clean(self):
        raw_data = self.data
        recaptcha_response = raw_data.get('g-recaptcha-response')

        recaptcha_request = requests.post(
            'https://www.google.com/recaptcha/api/siteverify',
            data={
                'secret': env('GOOGLE_RECAPTCHA_V2_SECRET_KEY'),
                'response': recaptcha_response
            }
        )

        recaptcha_result = recaptcha_request.json()

        if not recaptcha_result.get('success'):
            self.add_error(
                'comment',
                'Você é robô? Tente novamente.'
            )

        cleaned_data = self.cleaned_data
        name = cleaned_data.get('name')
        email = cleaned_data.get('email')
        comment = cleaned_data.get('comment')

        if len(name) < 3 or len(name) > 45:
            self.add_error('name', 'Nome precisa ter de 3 a 45 caracteres.')

    class Meta:
        model = Comment
        fields = ('name', 'email', 'comment',)
