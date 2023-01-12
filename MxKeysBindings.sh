#! /bin/bash

end=$((SECONDS+55))

while [ $SECONDS -lt $end ]; do
    hidutil property --matching '{"ProductID": 0xB35B}' --set '{"UserKeyMapping": 
    [{"HIDKeyboardModifierMappingSrc":0x7000000E7,
      "HIDKeyboardModifierMappingDst":0x7000000E6
    },
    {"HIDKeyboardModifierMappingSrc":0x7000000E6,
      "HIDKeyboardModifierMappingDst":0x7000000E7
    }]
    }'
    sleep 0.5
done
