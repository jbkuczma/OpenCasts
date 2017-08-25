import React, { Component, PropTypes } from 'react'
import {
	Text,
    View,
    StyleSheet
} from 'react-native'

export default class Episodes extends Component {
    
    render() {
        return (
            <View style={styles.container}>
                <Text> test </Text>
            </View>
        )
    }
}
const styles = StyleSheet.create({
  container: {
    flex: 1,
    justifyContent: 'center',
    alignItems: 'center'
  }
});

