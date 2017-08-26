import { AsyncStorage } from 'react-native'

/* Saving podcast */
export const savePodcastToDevice = (episode) => ({
    type: 'SAVE_PODCAST_TO_DEVICE',
    episode
})

/*****************************************/

/* Retrieving saved podcasts */
export const fetchLocalPodcasts = () => {
    return (dispatch) => {
        return AsyncStorage.getItem(key: '').then((podcasts) => { 
            dispatch(fetchLocalPodcastsSuccess(podcasts))
         })
    }
}
export const fetchLocalPodcastsSuccess = (podcasts) => ({
    type: 'FETCH_LOCAL_PODCASTS',
    podcasts
})
/*****************************************/

/* Searching */
export const search = (query) => {
    return (disptach) => {
        return fetch().then((searchResults) => {
            disptach(searchResults(searchResults))
        })
    }
}

export const searchResults = (results) => ({
    type: 'SEARCH_RESULTS',
    results
})
/*****************************************/