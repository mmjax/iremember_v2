import * as React from 'react'
import { StyleSheet, Text, Image, View,Button,Pressable, Alert, SafeAreaView, } from 'react-native';
import { NavigationContainer } from '@react-navigation/native'
import { createStackNavigator } from '@react-navigation/stack'

import Memory from '../components/Memory'


const Stack = createStackNavigator()

function MainStackNavigator() {

  
  return (
    <NavigationContainer>
    <Stack.Navigator>
    <Stack.Screen
          name='Memory'
          component={Memory}
          options={{title: ' ',
          headerShown: false,
          headerLeft: () => null,}}
        />
      
    </Stack.Navigator>
  </NavigationContainer>
  )
}

export default MainStackNavigator