import React, { Component } from 'react'
import {
  AppRegistry,
  StyleSheet,
  Text,
  View,
  Image
} from 'react-native'

import Episode from './Views/Episode/Episode'
import Episodes from './Views/Episodes/Episodes'
import Search from './Views/Search/Search'
import Player from './Views/Player/Player'

import { 
    Modal,
    Stack, 
    Scene, 
    Router,
    Actions
} from 'react-native-router-flux'

const searchIcon = () => {
    return (
        <Image 
            source={require('./Assets/search.png')} 
            style={{
                width: 24,
                height: 24
            }}
        />
    )
}

const backIcon = () => {
    return (
        <Image 
            source={require('./Assets/back.png')} 
            style={{
                width: 30,
                height: 30
            }}
        />
    )
}

export default class OpenCasts extends Component {
  
  render() {
    return (
        <Router>
            <Stack key="modal" modal hideNavBar>
                <Stack key="root" hideNavBar={false} >
                    <Scene key="episodes" component={Episodes} title="Podcasts" titleStyle={style.openCastsTitleStyle} rightTitle={searchIcon} onRight={() => Actions.search()} initial />
                    <Scene key="search" component={Search} title="Discover" titleStyle={style.openCastsTitleStyle} leftTitle={backIcon} onLeft={() => Actions.pop()} />
                    <Scene key="episode" component={Episode} back />
                </Stack>
                <Scene key="player" component={Player} hideNavBar />
            </Stack>
        </Router>                  
      )
  }
}

const style = StyleSheet.create({
    openCastsTitleStyle: {
        color: '#F44336'
    }
})
