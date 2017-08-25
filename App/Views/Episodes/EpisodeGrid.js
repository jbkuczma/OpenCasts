import React, { Component, PropTypes } from 'react'
import {
	Text,
	View
} from 'react-native'

export default class EpisodeGrid extends Component {

    render() {
        return (
            <View>
                <Text> grid </Text>
            </View>
        )
    }
}

Episodes.propTypes = {
    navigator: PropTypes.object
}