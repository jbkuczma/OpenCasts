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

export const getPopularPodcsts = () => {
    return (disptach) => {
        return fetch().then((searchResults) => {
            disppatch(getPopularPodcastsResults(searchResults))
        })
    }
}
export const getPopularPodcastsResults = (results) => ({
    type: 'POPULAR_PODCST_RESULTS',
    results
})

export const getCategories = () => {
    return (disptach) => {
        return fetch().then((searchResults) => {
            disppatch(getCategoriesResults(searchResults))
        })
    }
}
export const getCategoriesResults = (results) => ({
    type: 'CATEGORY_RESULTS',
    results
})
/*****************************************/