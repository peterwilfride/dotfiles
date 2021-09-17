#!/bin/bash

weather=`curl -sf "http://api.openweathermap.org/data/2.5/weather?q=Natal&appid=b1cd0797823e0380e2421f7bf083f510&units="metric""`

if [ ! -z "$weather" ]; then
	weather_temp=`echo "$weather" | jq ".main.temp" | cut -d "." -f 1`
	weather_icon_code=`echo "$weather" | jq -r ".weather[].icon" | head -1`
	#weather_description=`echo "$weather" | jq -r ".weather[].description" | head -1 | sed -e "s/\b\(.\)/\u\1/g"`

	#Big long if statement of doom
		if [ "$weather_icon_code" == "50d"  ]; then
			weather_icon=" "
			#weather_quote="Forecast says it's misty \nMake sure you don't get lost on your way..."
			weather_hex="#84afdb"
		elif [ "$weather_icon_code" == "50n"  ]; then
			weather_icon=" "
			#weather_quote="Forecast says it's a misty night \nDon't go anywhere tonight or you might get lost..."
			weather_hex="#84afdb"
		elif [ "$weather_icon_code" == "01d"  ]; then
			weather_icon=" "
			#weather_quote="It's a sunny day, gonna be fun! \nDon't go wandering all by yourself though..."
			weather_hex="#ffd86b"
		elif [ "$weather_icon_code" == "01n"  ]; then
			weather_icon=" "
			#weather_quote="It's a clear night \nYou might want to take a evening stroll to relax..."
			weather_hex="#fcdcf6"
		elif [ "$weather_icon_code" == "02d"  ]; then
			weather_icon=" "
			#weather_quote="It's  cloudy, sort of gloomy \nYou'd better get a book to read..."
			weather_hex="#adadff"
		elif [ "$weather_icon_code" == "02n"  ]; then
			weather_icon=" "
			#weather_quote="It's a cloudy night \nHow about some hot chocolate and a warm bed?"
			weather_hex="#adadff"
		elif [ "$weather_icon_code" == "03d"  ]; then
			weather_icon=" "
			#weather_quote="It's  cloudy, sort of gloomy \nYou'd better get a book to read..."
			weather_hex="#adadff"
		elif [ "$weather_icon_code" == "03n"  ]; then
			weather_icon=" "
			#weather_quote="It's a cloudy night \nHow about some hot chocolate and a warm bed?"
			weather_hex="#adadff"
		elif [ "$weather_icon_code" == "04d"  ]; then
			weather_icon=" "
			#weather_quote="It's  cloudy, sort of gloomy \nYou'd better get a book to read..."
			weather_hex="#adadff"
		elif [ "$weather_icon_code" == "04n"  ]; then
			weather_icon=" "
			#weather_quote="It's a cloudy night \nHow about some hot chocolate and a warm bed?"
			weather_hex="#adadff"
		elif [ "$weather_icon_code" == "09d"  ]; then
			weather_icon=" "
			#weather_quote="It's rainy, it's a great day! \nGet some ramen and watch as the rain falls..."
			weather_hex="#6b95ff"
		elif [ "$weather_icon_code" == "09n"  ]; then
			weather_icon=" "
			#weather_quote=" It's gonna rain tonight it seems \nMake sure your clothes aren't still outside..."
			weather_hex="#6b95ff"
		elif [ "$weather_icon_code" == "10d"  ]; then
			weather_icon=" "
			#weather_quote="It's rainy, it's a great day! \nGet some ramen and watch as the rain falls..."
			weather_hex="#6b95ff"
		elif [ "$weather_icon_code" == "10n"  ]; then
			weather_icon=" "
			#weather_quote=" It's gonna rain tonight it seems \nMake sure your clothes aren't still outside..."
			weather_hex="#6b95ff"
		elif [ "$weather_icon_code" == "11d"  ]; then
			weather_icon=""
			#weather_quote="There's storm for forecast today \nMake sure you don't get blown away..."
			weather_hex="#ffeb57"
		elif [ "$weather_icon_code" == "11n"  ]; then
			weather_icon=""
			#weather_quote="There's gonna be storms tonight \nMake sure you're warm in bed and the windows are shut..."
			weather_hex="#ffeb57"
		elif [ "$weather_icon_code" == "13d"  ]; then
			weather_icon=" "
			#weather_quote="It's gonna snow today \nYou'd better wear thick clothes and make a snowman as well!"
			weather_hex="#e3e6fc"
		elif [ "$weather_icon_code" == "13n"  ]; then
			weather_icon=" "
			#weather_quote="It's gonna snow tonight \nMake sure you get up early tomorrow to see the sights..."
			weather_hex="#e3e6fc"
		elif [ "$weather_icon_code" == "40d"  ]; then
			weather_icon=" "
			#weather_quote="Forecast says it's misty \nMake sure you don't get lost on your way..."
			weather_hex="#84afdb"
		elif [ "$weather_icon_code" == "40n"  ]; then
			weather_icon=" "
			#weather_quote="Forecast says it's a misty night \nDon't go anywhere tonight or you might get lost..."
			weather_hex="#84afdb"
		else 
			weather_icon=" "
			#weather_quote="Sort of odd, I don't know what to forecast \nMake sure you have a good time!"
			weather_hex="#adadff"
		fi		
fi

if [[ "$1" == "-icon" ]]; then
	echo ${weather_icon}
elif [[ "$1" == "-temp" ]]; then
	echo ${weather_temp}
elif [[ "$1" == "-hex" ]]; then
	echo ${weather_hex}
fi
