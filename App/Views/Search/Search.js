import React, { Component, PropTypes } from 'react'
import {
	Text,
    View,
    StyleSheet,
    TextInput
} from 'react-native'

export default class Search extends Component {
    render() {
        return (
            <View style={styles.discover}>
                <View style={styles.searchBarContainer}>
                    <View style={styles.searchBar}>
                        <TextInput
                            style={styles.searchBarInput}
                            autoCapitalize={'characters'}
                            autoFocus={true}
                            autoCorrect={false}
                            placeholder="Search"
                            keyboardType="default"
                            returnKeyType="search"
                        />
                    </View>
                </View>
                <View style={styles.featured}>
                    <Text> Categories </Text>
                </View>
            </View>
        )
    }
}

const styles = StyleSheet.create({
    discover: {
        flex: 1
    },
    searchBarContainer: {

    },
    searchBar: {
        flexDirection: 'row',
        justifyContent: 'center',
        alignItems: 'center',
        backgroundColor: '#FFFFFF',
        marginTop: 5,
        marginLeft: 10,
        marginRight: 10
    },
    searchBarInput: {
        flex: 1,
        flexDirection: 'column',
        height: 35,
        alignSelf: 'center',
        paddingLeft: 10
    },
    featured: {
        flex: 1
    }
})

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