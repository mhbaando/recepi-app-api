
from Users.views import sendException, sendTrials
from django.http import JsonResponse


def save_log(request, module, message):
    username = request.user.username
    names = request.user.first_name + " " + request.user.last_name
    avatar = str(request.user.avatar)
    module = module
    action = f'{names} {message}'
    path = request.path
    sendTrials(request, username, names, avatar, action, module, path)


def save_error(request, error):
    username = request.user.username
    name = request.user.first_name + " " + request.user.last_name
    # register the error
    sendException(request, username, name, error)
    message = {
        "isError": True,
        "Message": "On Error Occurs . Please try again or contact system administrator",
    }
    return JsonResponse(message, status=200)
