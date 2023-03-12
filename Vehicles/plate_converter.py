stateappreviations = [
    {"name": "Banaadir", "appreviation": "BN"},
    {"name": "Hirshabeelle", "appreviation": "HR"},
    {"name": "Galmudug", "appreviation": "GM"},
    {"name": "Puntland", "appreviation": "PN"},
    {"name": "Koonfur Galbeed", "appreviation": "KG"},
    {"name": "Jubba land", "appreviation": "JL"},
    {"name": "Somali land", "appreviation": "SL"},
]


def shorten(state, code, number):
    plate_no = ''
    for stateapprevaition in stateappreviations:
        if state.lower() in stateapprevaition['name'].lower():
            plate_no = "{}-{}-{}".format(
                stateapprevaition['appreviation'], code, number)
    return plate_no


def longer(wholePlate):
    state = ""
    code = ""
    number = ""
    if wholePlate is not None:
        short_state = wholePlate.split('-')[0]
        for stateapprevaition in stateappreviations:
            if short_state.lower() in stateapprevaition['appreviation'].lower():
                state = stateapprevaition['name']

        code = wholePlate.split('-')[1]
        number = wholePlate.split('-')[2]
    return {
        'state': state,
        'code': code,
        'number': number
    }
