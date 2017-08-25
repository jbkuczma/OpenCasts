import { Navigation } from 'react-native-navigation'

import Search from './Views/Search/Search'
import Episodes from './Views/Episodes/Episodes'
import Player from './Views/Player/Player'

// export function registerScreens(store, provider) {
//     Navigation.registerComponent('OpenCasts.Search', () => Search, store, provider)
//     Navigation.registerComponent('OpenCasts.Episode', () => Episode, store, provider)
//     Navigation.registerComponent('OpenCasts.UnplayedEpisodes', () => UnplayedEpisodes, store, provider)
//     Navigation.registerComponent('OpenCasts.Player', () => Player, store, provider)
// }

export function registerScreens() {
    Navigation.registerComponent('OpenCasts.Search', () => Search)
    Navigation.registerComponent('OpenCasts.Episodes', () => Episodes)
    Navigation.registerComponent('OpenCasts.Player', () => Player)
}