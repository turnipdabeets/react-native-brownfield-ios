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

import { useScreens } from 'react-native-screens';
import { createStackNavigator, createAppContainer } from "react-navigation";
// import { gestureHandlerRootHOC, RawButton } from 'react-native-gesture-handler'
console.log("useScreens", useScreens)
// console.log("gestureHandlerRootHOC, RawButton", gestureHandlerRootHOC, RawButton)
useScreens()

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
    backgroundColor: "brown"
  },
  welcome: {
    fontSize: 20,
    color: "white"
  }
});

class HomeScreen extends React.Component {
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
        <Button
          title="Go to Recursive screen"
          onPress={() => this.props.navigation.navigate('Recursive')}
        />
      </View>
    );
  }
}

class RecursiveScreen extends React.Component {

  static navigationOptions = ({ navigation }) => {
    return {
      headerTitle: "New Screen",
      headerRight: (
        <Button
          onPress={navigation.getParam('increaseCount')}
          title="+1"
          color="#fff"
        />
      ),
    };
  };

  componentDidMount() {
    this.props.navigation.setParams({ increaseCount: this._increaseCount });
  }

  state = {
    count: 0,
  };

  _increaseCount = () => {
    this.setState({ count: this.state.count + 1 });
  };

  render() {
    return (
      <View style={{ flex: 1, alignItems: 'center', justifyContent: 'center' }}>
        <Text>Screen {this.state.count}</Text>
        <Button
          title="Go to this screen... again"
          onPress={() => this.props.navigation.navigate('Recursive')}
        />
      </View>
    );
  }
}

const AppNavigator = createStackNavigator({
  Home: {
    screen: HomeScreen
  },
  Recursive: {
    screen: RecursiveScreen
  }
});

const App = createAppContainer(AppNavigator);

AppRegistry.registerComponent("HelloReact", () => App);
