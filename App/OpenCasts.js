import React, { Component } from 'react'
import {
  AppRegistry,
  StyleSheet,
  Text,
  View
} from 'react-native'

import Episodes from './Views/Episodes/Episodes'
import Search from './Views/Search/Search'
import Player from './Views/Player/Player'

import { 
    Modal,
    Stack, 
    Scene, 
    Router 
} from 'react-native-router-flux'

export default class OpenCasts extends Component {
  
  render() {
      return (
        <Router>
            <Stack key="root">
                <Scene key="episodes" component={Episodes} title="Podcasts" />
                <Scene key="search" component={Search} title="Discover" back/>
                <Modal>
                    <Scene key="episodes" component={Player} title="Podcasts" />
                </Modal>
            </Stack>
        </Router>                  
      )
  }
}
