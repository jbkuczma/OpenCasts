const intialState = []

const opencasts = (state = intialState, action) => {
    switch(action.type) {
        case 'SAVE_PODCAST_TO_DEVICE':
            return [
                ...state, {
                    
                }
            ]
        case 'FETCH_LOCAL_PODCASTS':
            return [
                ...state, {

                }
            ]
        case 'SEARCH': 
            return [
                ...state, {

                }
            ]
        default:
            return state
    }
}