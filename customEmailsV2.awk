BEGIN   {
    FS = ","
    flag = 1
}
{
    if ($5 > $4) {
        if (flag) {
            printf("#!/bin/bash\n") > "gcustomEmailsV2.bash";
            printf("if [ -d ./Emails ]; then\n") >> "gcustomEmailsV2.bash";
            printf("\trm -r Emails\n") >> "gcustomEmailsV2.bash";
            printf("fi\n") >> "gcustomEmailsV2.bash";
            printf("mkdir Emails\n") >> "gcustomEmailsV2.bash";
            flag = 0;
        }
        printf("sed '-e s/EMAIL/"$1"/' '-e s/FULLNAME/"$2"/' '-e s/NAME/"$2"/' '-e s/TITLE/"$3"/' '-e s/AMOUNT/"$5"/' '-e s|DATE|"date"|' template.txt > ./Emails/"$1"\n") >> "gcustomEmailsV2.bash";
    }
}
END {
}
