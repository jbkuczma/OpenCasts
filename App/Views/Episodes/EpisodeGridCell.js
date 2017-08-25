import React, { Component, PropTypes } from 'react'
import {
	Text,
	View
} from 'react-native'

export default class EpisodeGridCell extends Component {

    render() {
        return (
            <View>
                <Text> cell </Text>
            </View>
        )
    }
}

Episodes.propTypes = {
    navigator: PropTypes.object
}