import React, { Component, PropTypes } from 'react'
import {
	Text,
	View
} from 'react-native'

export default class Search extends Component {
    redner() {
        return (
            <View>
                <Text> Search </Text>
            </View>
        )
    }
}

Search.propTypes = {
    navigator: PropTypes.object
}

// function mapStateToProps(state, ownProps) {
//     return {

//     }
// }

// function mapDispatchToProps(dispatch) {
//     return {

//     }
// }

// export default connect(mapStateToProps, mapDispatchToProps)(Search)