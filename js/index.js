"use strict";
// 1
import React from "react";
import ReactNative, {
  AppRegistry,
  StyleSheet,
  Text,
  View,
  Button,
  NativeModules
} from "react-native";

// 2
const styles = StyleSheet.create({
  container: {
    flex: 1,
    justifyContent: "center",
    alignItems: "center",
    backgroundColor: "green"
  },
  welcome: {
    fontSize: 20,
    color: "white"
  }
});

// 3
class App extends React.Component {
  render() {
    return (
      <View style={styles.container}>
        <Text style={styles.welcome}>{`Hello ${this.props.name ||
          "Friend"}`}</Text>
        <Text style={styles.welcome}>We're live from React Native!!!</Text>
        <Button
          title="Back To Native"
          onPress={() => {
            NativeModules.ReactManager.dismissPresentedViewController(
              this.props.rootTag
            );
          }}
        />
      </View>
    );
  }
}

// 4
AppRegistry.registerComponent("HelloReact", () => App);
