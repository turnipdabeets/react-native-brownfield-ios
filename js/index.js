import React from "react";
import ReactNative, {
  AppRegistry,
  StyleSheet,
  Text,
  View,
  Button,
  NativeModules
} from "react-native";
import MessageQueue from "react-native/Libraries/BatchedBridge/MessageQueue.js";

/* 
 Uncomment for bridge debugging: https://blog.callstack.io/reactnative-how-to-check-what-passes-through-your-bridge-e435571ffd85 

 */
// const spyFunction = (msg) => {
//   console.log(msg);
// };
// MessageQueue.spy(spyFunction);

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

AppRegistry.registerComponent("HelloReact", () => App);
