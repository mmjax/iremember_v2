
import { StyleSheet, Text, View } from 'react-native';

import MainStackNavigator from './navigation/MainStackNavigator'

export default function App() {
  return (
    <MainStackNavigator>
      
    </MainStackNavigator>
  );
}

const styles = StyleSheet.create({
  container: {
    flex: 1,
    backgroundColor: '#sss',
    alignItems: 'center',
    justifyContent: 'center',
  },
});