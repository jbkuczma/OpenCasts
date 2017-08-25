import React, { Component } from 'react'
import {
  AppRegistry,
  StyleSheet,
  Text,
  View
} from 'react-native'

import { Navigation } from 'react-native-navigation'
import { registerScreens } from './screens'

registerScreens()

const navigatorStyle = {
	navBarTranslucent: true,
	drawUnderNavBar: true,
	navBarTextColor: 'white',
	navBarButtonColor: 'white',
	statusBarTextColorScheme: 'light',
	drawUnderTabBar: true
};

const tabs = [{
    label: 'Episodes',
    screen: 'OpenCasts.Episodes',
    title: 'Podcasts',
    navigatorStyle
},
{
    label: 'Discover',
    screen: 'OpenCasts.Search',
    title: 'Discover',
    navigatorStyle
}]

const tabStyles = {
    tabBarButtonColor: '#C62828',
    tabBarSelectedButtonColor: '#F44336',
    tabBarBackgroundColor: '#F8F8F8'
}

class OpenCasts extends Component {
  constructor(props) {
      super(props)
      this.startApp()
  }

  startApp() {
    Navigation.startTabBasedApp({
        tabs,
        tabsStyle: tabStyles,
        appStyle: {
            orientation: 'portrait'
        }
    })
  }
}

export default OpenCasts
