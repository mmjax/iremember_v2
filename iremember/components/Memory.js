import {
  StyleSheet,
  Text,
  View, ScrollView, Image, Button,FlatList, Alert, TextInput, Pressable, KeyboardAvoidingView, TouchableWithoutFeedback, Keyboard
} from 'react-native';
import React from 'react';
import { Stack, IconButton } from "@react-native-material/core";
import Icon from "@expo/vector-icons/MaterialCommunityIcons";


function Memory() {
  
    return (
        <View style={styles.container}>
            <ScrollView showsVerticalScrollIndicator={false} style={styles.body}>
              <View style={styles.header}>
              <IconButton style={styles.icon_footer}  icon={props => <Icon  name="arrow-left" {...props} color="#06648E"/>} />
              <Text style={styles.title}>Пикник у озера</Text>
              <IconButton style={styles.icon_footer}  icon={props => <Icon  name="trash-can-outline" {...props} color="#06648E"/>} />
              </View>
              <View style={styles.header_column}>
                <Text style={styles.title_min}>г. Москва, Парк Кузьминки</Text>
                <Text style={styles.title_min}>20.07.2023</Text>
              </View>

              <Text style={styles.text}>Волшебство пикника на берегу озера: отдых, романтика и веселье в одном месте </Text>

              <Image
                style={styles.img}
                source={{
                  uri: 'https://i.pinimg.com/564x/9d/37/17/9d371724897fc1b7e739932fc45ca60c.jpg',
                }}
              />

              <Text style={styles.text}>Мы приготовили много вкусной еды, которую принесли с собой: бутерброды, салаты, фрукты и напитки.</Text>

              <View style={styles.members_column}>
                <View style={styles.members_row}>

                <Image
                  style={styles.img_members}
                  source={{
                    uri: 'https://i.pinimg.com/564x/3e/57/ce/3e57ce7fc575fba54c197e6f8307c228.jpg',
                  }}
                />

                <Text style={styles.name}>Васильев Юрий</Text>
                </View>

                <View style={styles.members_row}>

                <Image
                  style={styles.img_members}
                  source={{
                    uri: 'https://i.pinimg.com/564x/9d/37/17/9d371724897fc1b7e739932fc45ca60c.jpg',
                  }}
                />

                <Text style={styles.name}>Яковлева Юля</Text>
                </View>


                
              </View>
            </ScrollView>
            

            <KeyboardAvoidingView behavior="padding" style={styles.screen}>
                <TouchableWithoutFeedback onPress={Keyboard.dismiss}>
                    <View style={styles.footer}> 
                      <Pressable style={styles.btn} >
                        <Text style={styles.btn_text}>Редактировать</Text>
                      </Pressable>
                    
                    </View>
                </TouchableWithoutFeedback>
            </KeyboardAvoidingView>
                
        </View>
    );

}

const styles = StyleSheet.create({
    container: {
        display: 'flex',
        flexDirection: 'column',
        alignItems: 'center',
        height: 844,
        backgroundColor: '#F5F5F5'
    
      },

      header:{
        display: 'flex',
        flexDirection: 'row',
        justifyContent: 'space-between',
        width: 342,
        alignSelf: 'center',
        marginTop: 50,
        marginBottom: 8,
      },

      title:{
        fontSize: 20,
      },

      title_min:{
        fontSize: 14,
        color: '#A3A6AA',
        marginBottom: 8
      },

      text:{
        width: 342,
        fontSize: 16,
        marginBottom: 24,

      },

      header_column:{
        display: 'flex',
        flexDirection: 'column',
        alignItems: 'center',
        marginBottom: 16,
      },
      
      members_row:{
        display: 'flex',
        flexDirection: 'row',
        marginBottom: 16,

      },

      img:{
        width: 342,
        height: 219,
        borderRadius: 16,
        marginBottom:24
      },

      img_members:{
        width: 40,
        height: 40,
        borderRadius: 50,
        marginRight: 8,
      },
      name:{
        fontSize: 16,
        marginTop: 12
      },

      btn:{
        width: 183,
        height: 32,
        backgroundColor: "#06648E",
        borderRadius: 28,
        alignSelf: 'center',
        
      },

      btn_text:{
        alignSelf: 'center',
        marginTop: 5,
        fontSize: 16,
        color: '#fff'

      },

      put_txt:{
        fontSize: 16,
        borderColor: '#C2C2C2',
        borderWidth: 1,
        height: 30,
        borderRadius: 10,
        backgroundColor: "#fff",
        width: 294,
        alignContent: 'center',
      },

      footer:{
        position: 'absolute',
            justifyContent: 'center',
            alignSelf: 'center',
            display: 'flex',
            flexDirection: 'row',
            justifyContent: 'space-around',
            width: 390,
            marginTop: -80,
            paddingTop: 8,
            height: 32,
            
            
    
    },

        icon_footer:{
        width: 30,
        height: 30,
        borderRadius: 50,

      },
      
})

export default Memory