
terraform apply - без параметров
	создает инстанс без elasic-ip с возможностью доступа по ssh c авторизацией по ключу в каталоге tf(прилагается)
terraform apply -var 'hlltf1_pub="ssh-rsa xXxXxX......."'
	задает "свой" публичный ключ для содаваемого KeyPair (дальнейший доступ к инстансу по "своему" приватному ключу)
	(terraform plan "сказал" что кавычки он заэкранирует сам (\")-поставил в описании плана автоматически )
terraform apply -var 'eip_attach=true'
	создает инстанс, создает elastic_ip, и "привязывает" его к инстансу.

	С elastic_ip поведение непонятное.
	Если создавать "с нуля" то инстанс создается, (в дефолтном сабнете?) , ему (по настройкам сабнета?) присваивается публичный адрес.
	И этот же адрес "становится" - elastic_ip (по крайней мере так это выглядит) (или при аттаче пуличный адрес заменяется на эластик). 
	В общем в результате и там и там один и тот же адрес.

	Но если сделать последовательность:
	terraform apply
	terraform apply -var 'eip_attach=true'
то во втором выводе public_ip и elastic_ip будут разные. Хотя субя по плану - терраформ только добавил и приаттачил эластик адрес, 
инстанс не пересоздавался. А в веб консоли и публичный и эластик адреса становятся равными эластик адресу.

Получается что эластик адрес при аттаче как-бы перетирает собой публичный адрес, но терраформ это не учитывает и в нашем 
выводе выводится "старый" публичный адрес. 

Вывод параметра elastic_ip сделан крайне "топорно" но этот момент мне максимально непонятен:  
в документации count в контексте aws_eip вообще не нашел :( Гугл привел к паре тредов на старые версии.
	(я так понял можно в одном ресурсе создать больше одного адреса?  [0],[1] и т.д.)
Попытки "вложить" условные опреаторы и зацепится за instance_id привели к "нерабочим" результатам
//value = aws_eip.this[0].instance == aws_instance.this.id ? aws_eip.this[0].public_ip : " not defined "
 работает только если эластик создается, иначе ошибка
//value var.eip_attach ? (aws_eip.this[0].instance == aws_instance.this.id ? aws_eip.this[0].public_ip : " not defined "): " not defined "
 такой подход вообще фиаско. :)
