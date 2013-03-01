unsigned long echo0 = 0; //超音波
unsigned long echo1 = 0; //超音波
unsigned long ushiro = 0; //超音波
int signalPin0 = 3; //超音波右
int signalPin1 = 6; //超音波左
int signalPin2 = 7; //超音波後
int i = 1;
boolean komachi[4] = {LOW,LOW,LOW,LOW}; //超音波

void setup(){ //初期設定
    pinMode(9, OUTPUT);
    pinMode(10, OUTPUT);
    pinMode(11, OUTPUT);
    pinMode(12, OUTPUT);
    Serial.begin(9600);    
    //角度表示のためのシリアル通信開始
}

void loop(){  //ループ処理
    sonic();
    i = 0;
    //Serial.println("");
    //delay(1000);
    
    while (i < 4) {
       digitalWrite(i+9,komachi[i]);
       i++;
    }
}


void sonic(){
    //まず信号ピンを出力に設定（発信用）  
    pinMode(signalPin0, OUTPUT);  
    //２マイクロ秒間LOWで出力  
    digitalWrite(signalPin0, LOW);  
    delayMicroseconds(2);  
    //５マイクロ秒間HIGHで出力  
    digitalWrite(signalPin0, HIGH);  
    delayMicroseconds(5);
    //超音波発信  
    //信号ピンをLOWに戻す  
    digitalWrite(signalPin0, LOW);   
     
    //信号ピンを入力に設定（受信用）  
    pinMode(signalPin0, INPUT);  
    //信号ピンをHIGHに設定  
    digitalWrite(signalPin0, HIGH);  
    //反射波が戻ってくるまでの時間を計測し  
    //片道の時間（半分の値）にする  
    echo0 = pulseIn(signalPin0, HIGH)/2;  
    //ミリメートル単位に変換  
    int distance0 = echo0*0.34442; 
     
    
    
    //まず信号ピンを出力に設定（発信用）  
    pinMode(signalPin1, OUTPUT);  
    //２マイクロ秒間LOWで出力  
    digitalWrite(signalPin1, LOW);  
    delayMicroseconds(2);  
    //５マイクロ秒間HIGHで出力  
    digitalWrite(signalPin1, HIGH);  
    delayMicroseconds(5);
    //超音波発信  
    //信号ピンをLOWに戻す  
    digitalWrite(signalPin1, LOW);   
     
    //信号ピンを入力に設定（受信用）  
    pinMode(signalPin1, INPUT);  
    //信号ピンをHIGHに設定  
    digitalWrite(signalPin1, HIGH);  
    //反射波が戻ってくるまでの時間を計測し  
    //片道の時間（半分の値）にする  
    echo1 = pulseIn(signalPin1, HIGH)/2;  
    //ミリメートル単位に変換  
    int distance1 = echo1*0.34442; 
    
    
    //まず信号ピンを出力に設定（発信用）  
    pinMode(signalPin2, OUTPUT);  
    //２マイクロ秒間LOWで出力  
    digitalWrite(signalPin2, LOW);  
    delayMicroseconds(2);  
    //５マイクロ秒間HIGHで出力  
    digitalWrite(signalPin2, HIGH);  
    delayMicroseconds(5);
    //超音波発信  
    //信号ピンをLOWに戻す  
    digitalWrite(signalPin2, LOW);   
     
    //信号ピンを入力に設定（受信用）  
    pinMode(signalPin2, INPUT);  
    //信号ピンをHIGHに設定  
    digitalWrite(signalPin2, HIGH);  
    //反射波が戻ってくるまでの時間を計測し  
    //片道の時間（半分の値）にする  
    ushiro = pulseIn(signalPin2, HIGH)/2;  
    //ミリメートル単位に変換  
    int usiro = ushiro*0.34442; 
     
    //距離を出力
    /*
    Serial.println(distance0);
    Serial.println(distance1);
    Serial.println(usiro);
    Serial.println("WRYYYYYYYYYYYYYY");
    */
    
    
    if((distance0 < distance1 + 100) && (distance0 > distance1 - 100) ) {  //まんなか
    	komachi[0] = true;
    	komachi[1] = true;
    }
    else if(distance0 < distance1) {  //左
    	komachi[0] = false;
    	komachi[1] = true;
    }
    else if(distance0 > distance1) {  //右
    	komachi[0] = true;
    	komachi[1] = false;
    }else{  //その
      	komachi[0] = false;
        komachi[1] = false;
    }
    
    if (usiro <= 300) {
      	komachi[2] = true;
        komachi[3] = true;
    } else if (usiro <= 600) {
      	komachi[2] = false;
        komachi[3] = true;
    } else if (usiro <= 900){
      	komachi[2] = true;
        komachi[3] = false;
    } else {
      	komachi[2] = false;
        komachi[3] = false;
    }

}
