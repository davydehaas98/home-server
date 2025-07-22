```shell
mosquitto_pub -t 'zigbee2mqtt/kitchen/light/set' -m <<EOF '{
    "state": "off"
}'
EOF
```

```shell
mosquitto_pub -t 'zigbee2mqtt/living/light/set' -m <<EOF '{
    "hue_power_on_behavior": "on",
    "hue_power_on_brightness": 127,
    "hue_power_on_color_temperature": 280,
    "hue_power_on_color": "#FFFFFF"
}'
EOF
```
