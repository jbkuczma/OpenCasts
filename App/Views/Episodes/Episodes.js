import React, { Component, PropTypes } from 'react'
import {
	Text,
	View
} from 'react-native'

export default class Episodes extends Component {

    static navigatorStyle = {
        navBarBackgroundColor: '#F8F8F8'
    }
    
    render() {
        return (
            <View>
                <Text> unplayed </Text>
            </View>
        )
    }
}

Episodes.propTypes = {
    navigator: PropTypes.object
}