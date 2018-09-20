'use strict';
// 1
import React from 'react';
import ReactNative, {
  AppRegistry,
  StyleSheet,
  Text,
  View,
} from 'react-native';

// 2
const styles = StyleSheet.create({
  container: {
    flex: 1,
    justifyContent: 'center',
    alignItems: 'center',
    backgroundColor: 'green',
  },
  welcome: {
    fontSize: 20,
    color: 'white',
  },
});

// 3
class App extends React.Component {
  render() {
    return (
      <View style={styles.container}>
        <Text style={styles.welcome}>We're live from React Native!!!</Text>
      </View>
    )
  }
}

// 4
AppRegistry.registerComponent('App', () => App);

