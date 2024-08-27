#! /bin/bash

PSQL="psql -X --username=freecodecamp --dbname=salon --tuples-only -c"

echo -e "\n~~~ Welcome to The Salon ~~~\n"

#MAIN MENU
MAIN_MENU() {
  if [[ $1 ]]
  then
  echo -e "\n$1"
  fi

  echo -e "\nWhat would you like to book today?"
  echo -e "1) hair_style\n2) massage\n3) nails\n4) skin_care"
  read SERVICE_ID_SELECTED

  case $SERVICE_ID_SELECTED in
  1) HAIR_STYLE 1;;
  2) MASSAGE 2;;
  3) NAILS 3;;
  4) SKIN_CARE 4;;
  *) MAIN_MENU "Please select one of the options available" ;;
  esac

}
HAIR_STYLE() {
  echo -e "\nWhat is your phone number?"
  read CUSTOMER_PHONE

   SERVICE=$($PSQL "SELECT name FROM services WHERE service_id='$1'")
  GET_NUMBERS=$($PSQL "SELECT name FROM customers WHERE phone='$CUSTOMER_PHONE'")

  if [[ -z $GET_NUMBERS ]]
  then
  
    echo "I do not have any recods for that phone number. What is your name?"
    read CUSTOMER_NAME
    INSERT_NAME=$($PSQL "INSERT INTO customers(phone, name) VALUES('$CUSTOMER_PHONE', '$CUSTOMER_NAME')")
  fi
  
    echo "What time would you like your hair style?"
    read SERVICE_TIME

    INSERT_TIME=$($PSQL "INSERT INTO appointments(time) VALUES('$SERVICE_TIME')")

    echo "I have put you down for a $(echo $SERVICE | sed -r 's/^ *| *$//g') at $SERVICE_TIME, $CUSTOMER_NAME."
}

MASSAGE() {
  echo -e "\nWhat is your phone number?"
  read CUSTOMER_PHONE

   SERVICE=$($PSQL "SELECT name FROM services WHERE service_id='$1'")
  GET_NUMBERS=$($PSQL "SELECT name FROM customers WHERE phone='$CUSTOMER_PHONE'")

  if [[ -z $GET_NUMBERS ]]
  then
  echo "I do not have any recods for that phone number. What is your name?"
  read CUSTOMER_NAME
  INSERT_NAME=$($PSQL "INSERT INTO customers(phone, name) VALUES('$CUSTOMER_PHONE', '$CUSTOMER_NAME')")
  
  fi

    echo "What time would you like your massage?"
    read SERVICE_TIME

    INSERT_TIME=$($PSQL "INSERT INTO appointments(time) VALUES('$SERVICE_TIME')")

    echo "I have put you down for a $(echo $SERVICE | sed -r 's/^ *| *$//g') at $SERVICE_TIME, $CUSTOMER_NAME."
}

NAILS() {
  echo -e "\nWhat is your phone number?"
  read CUSTOMER_PHONE

   SERVICE=$($PSQL "SELECT name FROM services WHERE service_id='$1'")
  GET_NUMBERS=$($PSQL "SELECT name FROM customers WHERE phone='$CUSTOMER_PHONE'")

  if [[ -z $GET_NUMBERS ]]
  then
    echo -e "\nI do not have any recods for that phone number. What is your name?"
    read CUSTOMER_NAME
    INSERT_NAME=$($PSQL "INSERT INTO customers(phone, name) VALUES('$CUSTOMER_PHONE', '$CUSTOMER_NAME')")
  fi
    echo "What time would you like your nails done?"
    read SERVICE_TIME

    INSERT_TIME=$($PSQL "INSERT INTO appointments(time) VALUES('$SERVICE_TIME')")

    echo "I have put you down for a $(echo $SERVICE | sed -r 's/^ *| *$//g') at $SERVICE_TIME, $CUSTOMER_NAME."
  
}

SKIN_CARE() {
  echo -e "\nWhat is your phone number?"
  read CUSTOMER_PHONE

   SERVICE=$($PSQL "SELECT name FROM services WHERE service_id='$1'")
  GET_NUMBERS=$($PSQL "SELECT name FROM customers WHERE phone='$CUSTOMER_PHONE'")

  if [[ -z $GET_NUMBERS ]]
  then
  echo "I do not have any recods for that phone number. What is your name?"
  read CUSTOMER_NAME
  INSERT_NAME=$($PSQL "INSERT INTO customers(phone, name) VALUES('$CUSTOMER_PHONE', '$CUSTOMER_NAME')")
  
  fi
    echo "What time would you like your skin care?"
    read SERVICE_TIME

    INSERT_TIME=$($PSQL "INSERT INTO appointments(time) VALUES('$SERVICE_TIME')")

    echo "I have put you down for a $(echo $SERVICE | sed -r 's/^ *| *$//g') at $SERVICE_TIME, $CUSTOMER_NAME."
}
MAIN_MENU
