BEGIN{
	s = 0
	r = 0
	forwardPkt = 0
}

{
	if($1 == "s" && $19 == "AGT"){
		s++;
	}
	if($1 == "r" && $19 == "AGT"){
		r++;
	}
	if($1 == "f" && $19 == "RTR"){
	forwardpkt++;
	}
}

END{
	printf("sent packets %d\n",s);
	printf("received packets %d\n",r);
	printf("recv to delivery ratio %f \n",r/s);
	printf("forwarded packects %d\n",forwardpkt++);
}
