import React, { Component, PropTypes } from 'react'
import {
	Text,
	View
} from 'react-native'

export default class Player extends Component {
    redner() {
        return (
            <View>
                <Text> Search </Text>
            </View>
        )
    }
}

Player.propTypes = {
    navigator: PropTypes.object
}