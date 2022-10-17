#/usr/bin/bash
if [[ $PWD =~ .*appsec-demo/cp ]];then
        echo -e "cp_token is required to be run from <....>/appsec-demo root directory"
        exit 1
fi
if [ -z "$1" ]; then
        echo "Usage  cp_token         - Display curent TOKEN value" 
	echo "       cp_token <TOKEN> - Set TOKEN Variable - <Check Point AppSec TOKEN copied from Infinity AppSEC portal>"
        echo ""
        if [[ $TOKEN ]]; then
	       echo -e "TOKEN variable is set to: $TOKEN \n"
	       exit 1
	       else
	          echo "TOKEN variable is NOT SET!  Please set before continuing with LAB"
	fi
        exit 1	
else
        sed -i 's/TOKEN=.*/TOKEN='$1'/' cpalias.sh
        export TOKEN=$1
        echo -e "TOKEN varable is changed to: \n $TOKEN in cpalias.sh script.\n Important reload the file via issuing the following command: \n source cpalias.sh \n for variable to be set. "
fi
