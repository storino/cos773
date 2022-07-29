
user/_find:     file format elf64-littleriscv


Disassembly of section .text:

0000000000000000 <find>:
#include "user/user.h"
#include "kernel/fs.h"

void
find(char *path, const char *filename)
{
   0:	d8010113          	addi	sp,sp,-640
   4:	26113c23          	sd	ra,632(sp)
   8:	26813823          	sd	s0,624(sp)
   c:	26913423          	sd	s1,616(sp)
  10:	27213023          	sd	s2,608(sp)
  14:	25313c23          	sd	s3,600(sp)
  18:	25413823          	sd	s4,592(sp)
  1c:	25513423          	sd	s5,584(sp)
  20:	25613023          	sd	s6,576(sp)
  24:	23713c23          	sd	s7,568(sp)
  28:	0500                	addi	s0,sp,640
  2a:	892a                	mv	s2,a0
  2c:	89ae                	mv	s3,a1
  char buf[512], *p;
  int fd;
  struct dirent de;
  struct stat st;

  if((fd = open(path, 0)) < 0){
  2e:	4581                	li	a1,0
  30:	00000097          	auipc	ra,0x0
  34:	4a8080e7          	jalr	1192(ra) # 4d8 <open>
  38:	04054a63          	bltz	a0,8c <find+0x8c>
  3c:	84aa                	mv	s1,a0
    fprintf(2, "find: cannot open %s\n", path);
    return;
  }

  if(fstat(fd, &st) < 0){
  3e:	d8840593          	addi	a1,s0,-632
  42:	00000097          	auipc	ra,0x0
  46:	4ae080e7          	jalr	1198(ra) # 4f0 <fstat>
  4a:	04054c63          	bltz	a0,a2 <find+0xa2>
    fprintf(2, "find: cannot stat %s\n", path);
    close(fd);
    return;
  }

  switch(st.type){
  4e:	d9041703          	lh	a4,-624(s0)
  52:	4785                	li	a5,1
  54:	06f70763          	beq	a4,a5,c2 <find+0xc2>
        find(buf, filename);
      }
    }
    break;
  }
  close(fd);
  58:	8526                	mv	a0,s1
  5a:	00000097          	auipc	ra,0x0
  5e:	466080e7          	jalr	1126(ra) # 4c0 <close>
}
  62:	27813083          	ld	ra,632(sp)
  66:	27013403          	ld	s0,624(sp)
  6a:	26813483          	ld	s1,616(sp)
  6e:	26013903          	ld	s2,608(sp)
  72:	25813983          	ld	s3,600(sp)
  76:	25013a03          	ld	s4,592(sp)
  7a:	24813a83          	ld	s5,584(sp)
  7e:	24013b03          	ld	s6,576(sp)
  82:	23813b83          	ld	s7,568(sp)
  86:	28010113          	addi	sp,sp,640
  8a:	8082                	ret
    fprintf(2, "find: cannot open %s\n", path);
  8c:	864a                	mv	a2,s2
  8e:	00001597          	auipc	a1,0x1
  92:	92a58593          	addi	a1,a1,-1750 # 9b8 <malloc+0xea>
  96:	4509                	li	a0,2
  98:	00000097          	auipc	ra,0x0
  9c:	74a080e7          	jalr	1866(ra) # 7e2 <fprintf>
    return;
  a0:	b7c9                	j	62 <find+0x62>
    fprintf(2, "find: cannot stat %s\n", path);
  a2:	864a                	mv	a2,s2
  a4:	00001597          	auipc	a1,0x1
  a8:	92c58593          	addi	a1,a1,-1748 # 9d0 <malloc+0x102>
  ac:	4509                	li	a0,2
  ae:	00000097          	auipc	ra,0x0
  b2:	734080e7          	jalr	1844(ra) # 7e2 <fprintf>
    close(fd);
  b6:	8526                	mv	a0,s1
  b8:	00000097          	auipc	ra,0x0
  bc:	408080e7          	jalr	1032(ra) # 4c0 <close>
    return;
  c0:	b74d                	j	62 <find+0x62>
    if(strlen(path) + 1 + DIRSIZ + 1 > sizeof buf){
  c2:	854a                	mv	a0,s2
  c4:	00000097          	auipc	ra,0x0
  c8:	1a6080e7          	jalr	422(ra) # 26a <strlen>
  cc:	2541                	addiw	a0,a0,16
  ce:	20000793          	li	a5,512
  d2:	00a7fb63          	bgeu	a5,a0,e8 <find+0xe8>
      printf("find: path too long\n");
  d6:	00001517          	auipc	a0,0x1
  da:	91250513          	addi	a0,a0,-1774 # 9e8 <malloc+0x11a>
  de:	00000097          	auipc	ra,0x0
  e2:	732080e7          	jalr	1842(ra) # 810 <printf>
      break;
  e6:	bf8d                	j	58 <find+0x58>
    strcpy(buf, path);
  e8:	85ca                	mv	a1,s2
  ea:	db040513          	addi	a0,s0,-592
  ee:	00000097          	auipc	ra,0x0
  f2:	134080e7          	jalr	308(ra) # 222 <strcpy>
    p = buf+strlen(buf);
  f6:	db040513          	addi	a0,s0,-592
  fa:	00000097          	auipc	ra,0x0
  fe:	170080e7          	jalr	368(ra) # 26a <strlen>
 102:	02051913          	slli	s2,a0,0x20
 106:	02095913          	srli	s2,s2,0x20
 10a:	db040793          	addi	a5,s0,-592
 10e:	993e                	add	s2,s2,a5
    *p++ = '/';
 110:	00190b13          	addi	s6,s2,1
 114:	02f00793          	li	a5,47
 118:	00f90023          	sb	a5,0(s2)
      if (!strcmp(de.name, ".") || !strcmp(de.name, "..")) continue;
 11c:	00001a97          	auipc	s5,0x1
 120:	8e4a8a93          	addi	s5,s5,-1820 # a00 <malloc+0x132>
 124:	00001b97          	auipc	s7,0x1
 128:	8e4b8b93          	addi	s7,s7,-1820 # a08 <malloc+0x13a>
 12c:	da240a13          	addi	s4,s0,-606
    while(read(fd, &de, sizeof(de)) == sizeof(de)){
 130:	4641                	li	a2,16
 132:	da040593          	addi	a1,s0,-608
 136:	8526                	mv	a0,s1
 138:	00000097          	auipc	ra,0x0
 13c:	378080e7          	jalr	888(ra) # 4b0 <read>
 140:	47c1                	li	a5,16
 142:	f0f51be3          	bne	a0,a5,58 <find+0x58>
      if(de.inum == 0)
 146:	da045783          	lhu	a5,-608(s0)
 14a:	d3fd                	beqz	a5,130 <find+0x130>
      if (!strcmp(de.name, ".") || !strcmp(de.name, "..")) continue;
 14c:	85d6                	mv	a1,s5
 14e:	8552                	mv	a0,s4
 150:	00000097          	auipc	ra,0x0
 154:	0ee080e7          	jalr	238(ra) # 23e <strcmp>
 158:	dd61                	beqz	a0,130 <find+0x130>
 15a:	85de                	mv	a1,s7
 15c:	8552                	mv	a0,s4
 15e:	00000097          	auipc	ra,0x0
 162:	0e0080e7          	jalr	224(ra) # 23e <strcmp>
 166:	d569                	beqz	a0,130 <find+0x130>
      memmove(p, de.name, DIRSIZ);
 168:	4639                	li	a2,14
 16a:	da240593          	addi	a1,s0,-606
 16e:	855a                	mv	a0,s6
 170:	00000097          	auipc	ra,0x0
 174:	272080e7          	jalr	626(ra) # 3e2 <memmove>
      p[DIRSIZ] = 0;
 178:	000907a3          	sb	zero,15(s2)
      if(stat(buf, &st) < 0){
 17c:	d8840593          	addi	a1,s0,-632
 180:	db040513          	addi	a0,s0,-592
 184:	00000097          	auipc	ra,0x0
 188:	1ce080e7          	jalr	462(ra) # 352 <stat>
 18c:	02054563          	bltz	a0,1b6 <find+0x1b6>
      if (st.type == T_FILE) {
 190:	d9041783          	lh	a5,-624(s0)
 194:	0007869b          	sext.w	a3,a5
 198:	4709                	li	a4,2
 19a:	02e68963          	beq	a3,a4,1cc <find+0x1cc>
      } else if (st.type == T_DIR) {
 19e:	2781                	sext.w	a5,a5
 1a0:	4705                	li	a4,1
 1a2:	f8e797e3          	bne	a5,a4,130 <find+0x130>
        find(buf, filename);
 1a6:	85ce                	mv	a1,s3
 1a8:	db040513          	addi	a0,s0,-592
 1ac:	00000097          	auipc	ra,0x0
 1b0:	e54080e7          	jalr	-428(ra) # 0 <find>
 1b4:	bfb5                	j	130 <find+0x130>
        printf("find: cannot stat %s\n", buf);
 1b6:	db040593          	addi	a1,s0,-592
 1ba:	00001517          	auipc	a0,0x1
 1be:	81650513          	addi	a0,a0,-2026 # 9d0 <malloc+0x102>
 1c2:	00000097          	auipc	ra,0x0
 1c6:	64e080e7          	jalr	1614(ra) # 810 <printf>
        continue;
 1ca:	b79d                	j	130 <find+0x130>
        if (!strcmp(de.name, filename)) printf("%s\n", buf);
 1cc:	85ce                	mv	a1,s3
 1ce:	da240513          	addi	a0,s0,-606
 1d2:	00000097          	auipc	ra,0x0
 1d6:	06c080e7          	jalr	108(ra) # 23e <strcmp>
 1da:	f939                	bnez	a0,130 <find+0x130>
 1dc:	db040593          	addi	a1,s0,-592
 1e0:	00001517          	auipc	a0,0x1
 1e4:	83050513          	addi	a0,a0,-2000 # a10 <malloc+0x142>
 1e8:	00000097          	auipc	ra,0x0
 1ec:	628080e7          	jalr	1576(ra) # 810 <printf>
 1f0:	b781                	j	130 <find+0x130>

00000000000001f2 <main>:

int
main(int argc, char *argv[])
{
 1f2:	1141                	addi	sp,sp,-16
 1f4:	e406                	sd	ra,8(sp)
 1f6:	e022                	sd	s0,0(sp)
 1f8:	0800                	addi	s0,sp,16
  if(argc != 3){
 1fa:	470d                	li	a4,3
 1fc:	00e50763          	beq	a0,a4,20a <main+0x18>
    //find(".");
    exit(1);
 200:	4505                	li	a0,1
 202:	00000097          	auipc	ra,0x0
 206:	296080e7          	jalr	662(ra) # 498 <exit>
 20a:	87ae                	mv	a5,a1
  }
  find(argv[1], argv[2]);
 20c:	698c                	ld	a1,16(a1)
 20e:	6788                	ld	a0,8(a5)
 210:	00000097          	auipc	ra,0x0
 214:	df0080e7          	jalr	-528(ra) # 0 <find>
  exit(0);
 218:	4501                	li	a0,0
 21a:	00000097          	auipc	ra,0x0
 21e:	27e080e7          	jalr	638(ra) # 498 <exit>

0000000000000222 <strcpy>:
#include "kernel/fcntl.h"
#include "user/user.h"

char*
strcpy(char *s, const char *t)
{
 222:	1141                	addi	sp,sp,-16
 224:	e422                	sd	s0,8(sp)
 226:	0800                	addi	s0,sp,16
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
 228:	87aa                	mv	a5,a0
 22a:	0585                	addi	a1,a1,1
 22c:	0785                	addi	a5,a5,1
 22e:	fff5c703          	lbu	a4,-1(a1)
 232:	fee78fa3          	sb	a4,-1(a5)
 236:	fb75                	bnez	a4,22a <strcpy+0x8>
    ;
  return os;
}
 238:	6422                	ld	s0,8(sp)
 23a:	0141                	addi	sp,sp,16
 23c:	8082                	ret

000000000000023e <strcmp>:

int
strcmp(const char *p, const char *q)
{
 23e:	1141                	addi	sp,sp,-16
 240:	e422                	sd	s0,8(sp)
 242:	0800                	addi	s0,sp,16
  while(*p && *p == *q)
 244:	00054783          	lbu	a5,0(a0)
 248:	cb91                	beqz	a5,25c <strcmp+0x1e>
 24a:	0005c703          	lbu	a4,0(a1)
 24e:	00f71763          	bne	a4,a5,25c <strcmp+0x1e>
    p++, q++;
 252:	0505                	addi	a0,a0,1
 254:	0585                	addi	a1,a1,1
  while(*p && *p == *q)
 256:	00054783          	lbu	a5,0(a0)
 25a:	fbe5                	bnez	a5,24a <strcmp+0xc>
  return (uchar)*p - (uchar)*q;
 25c:	0005c503          	lbu	a0,0(a1)
}
 260:	40a7853b          	subw	a0,a5,a0
 264:	6422                	ld	s0,8(sp)
 266:	0141                	addi	sp,sp,16
 268:	8082                	ret

000000000000026a <strlen>:

uint
strlen(const char *s)
{
 26a:	1141                	addi	sp,sp,-16
 26c:	e422                	sd	s0,8(sp)
 26e:	0800                	addi	s0,sp,16
  int n;

  for(n = 0; s[n]; n++)
 270:	00054783          	lbu	a5,0(a0)
 274:	cf91                	beqz	a5,290 <strlen+0x26>
 276:	0505                	addi	a0,a0,1
 278:	87aa                	mv	a5,a0
 27a:	4685                	li	a3,1
 27c:	9e89                	subw	a3,a3,a0
 27e:	00f6853b          	addw	a0,a3,a5
 282:	0785                	addi	a5,a5,1
 284:	fff7c703          	lbu	a4,-1(a5)
 288:	fb7d                	bnez	a4,27e <strlen+0x14>
    ;
  return n;
}
 28a:	6422                	ld	s0,8(sp)
 28c:	0141                	addi	sp,sp,16
 28e:	8082                	ret
  for(n = 0; s[n]; n++)
 290:	4501                	li	a0,0
 292:	bfe5                	j	28a <strlen+0x20>

0000000000000294 <memset>:

void*
memset(void *dst, int c, uint n)
{
 294:	1141                	addi	sp,sp,-16
 296:	e422                	sd	s0,8(sp)
 298:	0800                	addi	s0,sp,16
  char *cdst = (char *) dst;
  int i;
  for(i = 0; i < n; i++){
 29a:	ce09                	beqz	a2,2b4 <memset+0x20>
 29c:	87aa                	mv	a5,a0
 29e:	fff6071b          	addiw	a4,a2,-1
 2a2:	1702                	slli	a4,a4,0x20
 2a4:	9301                	srli	a4,a4,0x20
 2a6:	0705                	addi	a4,a4,1
 2a8:	972a                	add	a4,a4,a0
    cdst[i] = c;
 2aa:	00b78023          	sb	a1,0(a5)
  for(i = 0; i < n; i++){
 2ae:	0785                	addi	a5,a5,1
 2b0:	fee79de3          	bne	a5,a4,2aa <memset+0x16>
  }
  return dst;
}
 2b4:	6422                	ld	s0,8(sp)
 2b6:	0141                	addi	sp,sp,16
 2b8:	8082                	ret

00000000000002ba <strchr>:

char*
strchr(const char *s, char c)
{
 2ba:	1141                	addi	sp,sp,-16
 2bc:	e422                	sd	s0,8(sp)
 2be:	0800                	addi	s0,sp,16
  for(; *s; s++)
 2c0:	00054783          	lbu	a5,0(a0)
 2c4:	cb99                	beqz	a5,2da <strchr+0x20>
    if(*s == c)
 2c6:	00f58763          	beq	a1,a5,2d4 <strchr+0x1a>
  for(; *s; s++)
 2ca:	0505                	addi	a0,a0,1
 2cc:	00054783          	lbu	a5,0(a0)
 2d0:	fbfd                	bnez	a5,2c6 <strchr+0xc>
      return (char*)s;
  return 0;
 2d2:	4501                	li	a0,0
}
 2d4:	6422                	ld	s0,8(sp)
 2d6:	0141                	addi	sp,sp,16
 2d8:	8082                	ret
  return 0;
 2da:	4501                	li	a0,0
 2dc:	bfe5                	j	2d4 <strchr+0x1a>

00000000000002de <gets>:

char*
gets(char *buf, int max)
{
 2de:	711d                	addi	sp,sp,-96
 2e0:	ec86                	sd	ra,88(sp)
 2e2:	e8a2                	sd	s0,80(sp)
 2e4:	e4a6                	sd	s1,72(sp)
 2e6:	e0ca                	sd	s2,64(sp)
 2e8:	fc4e                	sd	s3,56(sp)
 2ea:	f852                	sd	s4,48(sp)
 2ec:	f456                	sd	s5,40(sp)
 2ee:	f05a                	sd	s6,32(sp)
 2f0:	ec5e                	sd	s7,24(sp)
 2f2:	1080                	addi	s0,sp,96
 2f4:	8baa                	mv	s7,a0
 2f6:	8a2e                	mv	s4,a1
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 2f8:	892a                	mv	s2,a0
 2fa:	4481                	li	s1,0
    cc = read(0, &c, 1);
    if(cc < 1)
      break;
    buf[i++] = c;
    if(c == '\n' || c == '\r')
 2fc:	4aa9                	li	s5,10
 2fe:	4b35                	li	s6,13
  for(i=0; i+1 < max; ){
 300:	89a6                	mv	s3,s1
 302:	2485                	addiw	s1,s1,1
 304:	0344d863          	bge	s1,s4,334 <gets+0x56>
    cc = read(0, &c, 1);
 308:	4605                	li	a2,1
 30a:	faf40593          	addi	a1,s0,-81
 30e:	4501                	li	a0,0
 310:	00000097          	auipc	ra,0x0
 314:	1a0080e7          	jalr	416(ra) # 4b0 <read>
    if(cc < 1)
 318:	00a05e63          	blez	a0,334 <gets+0x56>
    buf[i++] = c;
 31c:	faf44783          	lbu	a5,-81(s0)
 320:	00f90023          	sb	a5,0(s2)
    if(c == '\n' || c == '\r')
 324:	01578763          	beq	a5,s5,332 <gets+0x54>
 328:	0905                	addi	s2,s2,1
 32a:	fd679be3          	bne	a5,s6,300 <gets+0x22>
  for(i=0; i+1 < max; ){
 32e:	89a6                	mv	s3,s1
 330:	a011                	j	334 <gets+0x56>
 332:	89a6                	mv	s3,s1
      break;
  }
  buf[i] = '\0';
 334:	99de                	add	s3,s3,s7
 336:	00098023          	sb	zero,0(s3)
  return buf;
}
 33a:	855e                	mv	a0,s7
 33c:	60e6                	ld	ra,88(sp)
 33e:	6446                	ld	s0,80(sp)
 340:	64a6                	ld	s1,72(sp)
 342:	6906                	ld	s2,64(sp)
 344:	79e2                	ld	s3,56(sp)
 346:	7a42                	ld	s4,48(sp)
 348:	7aa2                	ld	s5,40(sp)
 34a:	7b02                	ld	s6,32(sp)
 34c:	6be2                	ld	s7,24(sp)
 34e:	6125                	addi	sp,sp,96
 350:	8082                	ret

0000000000000352 <stat>:

int
stat(const char *n, struct stat *st)
{
 352:	1101                	addi	sp,sp,-32
 354:	ec06                	sd	ra,24(sp)
 356:	e822                	sd	s0,16(sp)
 358:	e426                	sd	s1,8(sp)
 35a:	e04a                	sd	s2,0(sp)
 35c:	1000                	addi	s0,sp,32
 35e:	892e                	mv	s2,a1
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 360:	4581                	li	a1,0
 362:	00000097          	auipc	ra,0x0
 366:	176080e7          	jalr	374(ra) # 4d8 <open>
  if(fd < 0)
 36a:	02054563          	bltz	a0,394 <stat+0x42>
 36e:	84aa                	mv	s1,a0
    return -1;
  r = fstat(fd, st);
 370:	85ca                	mv	a1,s2
 372:	00000097          	auipc	ra,0x0
 376:	17e080e7          	jalr	382(ra) # 4f0 <fstat>
 37a:	892a                	mv	s2,a0
  close(fd);
 37c:	8526                	mv	a0,s1
 37e:	00000097          	auipc	ra,0x0
 382:	142080e7          	jalr	322(ra) # 4c0 <close>
  return r;
}
 386:	854a                	mv	a0,s2
 388:	60e2                	ld	ra,24(sp)
 38a:	6442                	ld	s0,16(sp)
 38c:	64a2                	ld	s1,8(sp)
 38e:	6902                	ld	s2,0(sp)
 390:	6105                	addi	sp,sp,32
 392:	8082                	ret
    return -1;
 394:	597d                	li	s2,-1
 396:	bfc5                	j	386 <stat+0x34>

0000000000000398 <atoi>:

int
atoi(const char *s)
{
 398:	1141                	addi	sp,sp,-16
 39a:	e422                	sd	s0,8(sp)
 39c:	0800                	addi	s0,sp,16
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 39e:	00054603          	lbu	a2,0(a0)
 3a2:	fd06079b          	addiw	a5,a2,-48
 3a6:	0ff7f793          	andi	a5,a5,255
 3aa:	4725                	li	a4,9
 3ac:	02f76963          	bltu	a4,a5,3de <atoi+0x46>
 3b0:	86aa                	mv	a3,a0
  n = 0;
 3b2:	4501                	li	a0,0
  while('0' <= *s && *s <= '9')
 3b4:	45a5                	li	a1,9
    n = n*10 + *s++ - '0';
 3b6:	0685                	addi	a3,a3,1
 3b8:	0025179b          	slliw	a5,a0,0x2
 3bc:	9fa9                	addw	a5,a5,a0
 3be:	0017979b          	slliw	a5,a5,0x1
 3c2:	9fb1                	addw	a5,a5,a2
 3c4:	fd07851b          	addiw	a0,a5,-48
  while('0' <= *s && *s <= '9')
 3c8:	0006c603          	lbu	a2,0(a3)
 3cc:	fd06071b          	addiw	a4,a2,-48
 3d0:	0ff77713          	andi	a4,a4,255
 3d4:	fee5f1e3          	bgeu	a1,a4,3b6 <atoi+0x1e>
  return n;
}
 3d8:	6422                	ld	s0,8(sp)
 3da:	0141                	addi	sp,sp,16
 3dc:	8082                	ret
  n = 0;
 3de:	4501                	li	a0,0
 3e0:	bfe5                	j	3d8 <atoi+0x40>

00000000000003e2 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 3e2:	1141                	addi	sp,sp,-16
 3e4:	e422                	sd	s0,8(sp)
 3e6:	0800                	addi	s0,sp,16
  char *dst;
  const char *src;

  dst = vdst;
  src = vsrc;
  if (src > dst) {
 3e8:	02b57663          	bgeu	a0,a1,414 <memmove+0x32>
    while(n-- > 0)
 3ec:	02c05163          	blez	a2,40e <memmove+0x2c>
 3f0:	fff6079b          	addiw	a5,a2,-1
 3f4:	1782                	slli	a5,a5,0x20
 3f6:	9381                	srli	a5,a5,0x20
 3f8:	0785                	addi	a5,a5,1
 3fa:	97aa                	add	a5,a5,a0
  dst = vdst;
 3fc:	872a                	mv	a4,a0
      *dst++ = *src++;
 3fe:	0585                	addi	a1,a1,1
 400:	0705                	addi	a4,a4,1
 402:	fff5c683          	lbu	a3,-1(a1)
 406:	fed70fa3          	sb	a3,-1(a4)
    while(n-- > 0)
 40a:	fee79ae3          	bne	a5,a4,3fe <memmove+0x1c>
    src += n;
    while(n-- > 0)
      *--dst = *--src;
  }
  return vdst;
}
 40e:	6422                	ld	s0,8(sp)
 410:	0141                	addi	sp,sp,16
 412:	8082                	ret
    dst += n;
 414:	00c50733          	add	a4,a0,a2
    src += n;
 418:	95b2                	add	a1,a1,a2
    while(n-- > 0)
 41a:	fec05ae3          	blez	a2,40e <memmove+0x2c>
 41e:	fff6079b          	addiw	a5,a2,-1
 422:	1782                	slli	a5,a5,0x20
 424:	9381                	srli	a5,a5,0x20
 426:	fff7c793          	not	a5,a5
 42a:	97ba                	add	a5,a5,a4
      *--dst = *--src;
 42c:	15fd                	addi	a1,a1,-1
 42e:	177d                	addi	a4,a4,-1
 430:	0005c683          	lbu	a3,0(a1)
 434:	00d70023          	sb	a3,0(a4)
    while(n-- > 0)
 438:	fee79ae3          	bne	a5,a4,42c <memmove+0x4a>
 43c:	bfc9                	j	40e <memmove+0x2c>

000000000000043e <memcmp>:

int
memcmp(const void *s1, const void *s2, uint n)
{
 43e:	1141                	addi	sp,sp,-16
 440:	e422                	sd	s0,8(sp)
 442:	0800                	addi	s0,sp,16
  const char *p1 = s1, *p2 = s2;
  while (n-- > 0) {
 444:	ca05                	beqz	a2,474 <memcmp+0x36>
 446:	fff6069b          	addiw	a3,a2,-1
 44a:	1682                	slli	a3,a3,0x20
 44c:	9281                	srli	a3,a3,0x20
 44e:	0685                	addi	a3,a3,1
 450:	96aa                	add	a3,a3,a0
    if (*p1 != *p2) {
 452:	00054783          	lbu	a5,0(a0)
 456:	0005c703          	lbu	a4,0(a1)
 45a:	00e79863          	bne	a5,a4,46a <memcmp+0x2c>
      return *p1 - *p2;
    }
    p1++;
 45e:	0505                	addi	a0,a0,1
    p2++;
 460:	0585                	addi	a1,a1,1
  while (n-- > 0) {
 462:	fed518e3          	bne	a0,a3,452 <memcmp+0x14>
  }
  return 0;
 466:	4501                	li	a0,0
 468:	a019                	j	46e <memcmp+0x30>
      return *p1 - *p2;
 46a:	40e7853b          	subw	a0,a5,a4
}
 46e:	6422                	ld	s0,8(sp)
 470:	0141                	addi	sp,sp,16
 472:	8082                	ret
  return 0;
 474:	4501                	li	a0,0
 476:	bfe5                	j	46e <memcmp+0x30>

0000000000000478 <memcpy>:

void *
memcpy(void *dst, const void *src, uint n)
{
 478:	1141                	addi	sp,sp,-16
 47a:	e406                	sd	ra,8(sp)
 47c:	e022                	sd	s0,0(sp)
 47e:	0800                	addi	s0,sp,16
  return memmove(dst, src, n);
 480:	00000097          	auipc	ra,0x0
 484:	f62080e7          	jalr	-158(ra) # 3e2 <memmove>
}
 488:	60a2                	ld	ra,8(sp)
 48a:	6402                	ld	s0,0(sp)
 48c:	0141                	addi	sp,sp,16
 48e:	8082                	ret

0000000000000490 <fork>:
# generated by usys.pl - do not edit
#include "kernel/syscall.h"
.global fork
fork:
 li a7, SYS_fork
 490:	4885                	li	a7,1
 ecall
 492:	00000073          	ecall
 ret
 496:	8082                	ret

0000000000000498 <exit>:
.global exit
exit:
 li a7, SYS_exit
 498:	4889                	li	a7,2
 ecall
 49a:	00000073          	ecall
 ret
 49e:	8082                	ret

00000000000004a0 <wait>:
.global wait
wait:
 li a7, SYS_wait
 4a0:	488d                	li	a7,3
 ecall
 4a2:	00000073          	ecall
 ret
 4a6:	8082                	ret

00000000000004a8 <pipe>:
.global pipe
pipe:
 li a7, SYS_pipe
 4a8:	4891                	li	a7,4
 ecall
 4aa:	00000073          	ecall
 ret
 4ae:	8082                	ret

00000000000004b0 <read>:
.global read
read:
 li a7, SYS_read
 4b0:	4895                	li	a7,5
 ecall
 4b2:	00000073          	ecall
 ret
 4b6:	8082                	ret

00000000000004b8 <write>:
.global write
write:
 li a7, SYS_write
 4b8:	48c1                	li	a7,16
 ecall
 4ba:	00000073          	ecall
 ret
 4be:	8082                	ret

00000000000004c0 <close>:
.global close
close:
 li a7, SYS_close
 4c0:	48d5                	li	a7,21
 ecall
 4c2:	00000073          	ecall
 ret
 4c6:	8082                	ret

00000000000004c8 <kill>:
.global kill
kill:
 li a7, SYS_kill
 4c8:	4899                	li	a7,6
 ecall
 4ca:	00000073          	ecall
 ret
 4ce:	8082                	ret

00000000000004d0 <exec>:
.global exec
exec:
 li a7, SYS_exec
 4d0:	489d                	li	a7,7
 ecall
 4d2:	00000073          	ecall
 ret
 4d6:	8082                	ret

00000000000004d8 <open>:
.global open
open:
 li a7, SYS_open
 4d8:	48bd                	li	a7,15
 ecall
 4da:	00000073          	ecall
 ret
 4de:	8082                	ret

00000000000004e0 <mknod>:
.global mknod
mknod:
 li a7, SYS_mknod
 4e0:	48c5                	li	a7,17
 ecall
 4e2:	00000073          	ecall
 ret
 4e6:	8082                	ret

00000000000004e8 <unlink>:
.global unlink
unlink:
 li a7, SYS_unlink
 4e8:	48c9                	li	a7,18
 ecall
 4ea:	00000073          	ecall
 ret
 4ee:	8082                	ret

00000000000004f0 <fstat>:
.global fstat
fstat:
 li a7, SYS_fstat
 4f0:	48a1                	li	a7,8
 ecall
 4f2:	00000073          	ecall
 ret
 4f6:	8082                	ret

00000000000004f8 <link>:
.global link
link:
 li a7, SYS_link
 4f8:	48cd                	li	a7,19
 ecall
 4fa:	00000073          	ecall
 ret
 4fe:	8082                	ret

0000000000000500 <mkdir>:
.global mkdir
mkdir:
 li a7, SYS_mkdir
 500:	48d1                	li	a7,20
 ecall
 502:	00000073          	ecall
 ret
 506:	8082                	ret

0000000000000508 <chdir>:
.global chdir
chdir:
 li a7, SYS_chdir
 508:	48a5                	li	a7,9
 ecall
 50a:	00000073          	ecall
 ret
 50e:	8082                	ret

0000000000000510 <dup>:
.global dup
dup:
 li a7, SYS_dup
 510:	48a9                	li	a7,10
 ecall
 512:	00000073          	ecall
 ret
 516:	8082                	ret

0000000000000518 <getpid>:
.global getpid
getpid:
 li a7, SYS_getpid
 518:	48ad                	li	a7,11
 ecall
 51a:	00000073          	ecall
 ret
 51e:	8082                	ret

0000000000000520 <sbrk>:
.global sbrk
sbrk:
 li a7, SYS_sbrk
 520:	48b1                	li	a7,12
 ecall
 522:	00000073          	ecall
 ret
 526:	8082                	ret

0000000000000528 <sleep>:
.global sleep
sleep:
 li a7, SYS_sleep
 528:	48b5                	li	a7,13
 ecall
 52a:	00000073          	ecall
 ret
 52e:	8082                	ret

0000000000000530 <uptime>:
.global uptime
uptime:
 li a7, SYS_uptime
 530:	48b9                	li	a7,14
 ecall
 532:	00000073          	ecall
 ret
 536:	8082                	ret

0000000000000538 <putc>:

static char digits[] = "0123456789ABCDEF";

static void
putc(int fd, char c)
{
 538:	1101                	addi	sp,sp,-32
 53a:	ec06                	sd	ra,24(sp)
 53c:	e822                	sd	s0,16(sp)
 53e:	1000                	addi	s0,sp,32
 540:	feb407a3          	sb	a1,-17(s0)
  write(fd, &c, 1);
 544:	4605                	li	a2,1
 546:	fef40593          	addi	a1,s0,-17
 54a:	00000097          	auipc	ra,0x0
 54e:	f6e080e7          	jalr	-146(ra) # 4b8 <write>
}
 552:	60e2                	ld	ra,24(sp)
 554:	6442                	ld	s0,16(sp)
 556:	6105                	addi	sp,sp,32
 558:	8082                	ret

000000000000055a <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
 55a:	7139                	addi	sp,sp,-64
 55c:	fc06                	sd	ra,56(sp)
 55e:	f822                	sd	s0,48(sp)
 560:	f426                	sd	s1,40(sp)
 562:	f04a                	sd	s2,32(sp)
 564:	ec4e                	sd	s3,24(sp)
 566:	0080                	addi	s0,sp,64
 568:	84aa                	mv	s1,a0
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
 56a:	c299                	beqz	a3,570 <printint+0x16>
 56c:	0805c863          	bltz	a1,5fc <printint+0xa2>
    neg = 1;
    x = -xx;
  } else {
    x = xx;
 570:	2581                	sext.w	a1,a1
  neg = 0;
 572:	4881                	li	a7,0
 574:	fc040693          	addi	a3,s0,-64
  }

  i = 0;
 578:	4701                	li	a4,0
  do{
    buf[i++] = digits[x % base];
 57a:	2601                	sext.w	a2,a2
 57c:	00000517          	auipc	a0,0x0
 580:	4a450513          	addi	a0,a0,1188 # a20 <digits>
 584:	883a                	mv	a6,a4
 586:	2705                	addiw	a4,a4,1
 588:	02c5f7bb          	remuw	a5,a1,a2
 58c:	1782                	slli	a5,a5,0x20
 58e:	9381                	srli	a5,a5,0x20
 590:	97aa                	add	a5,a5,a0
 592:	0007c783          	lbu	a5,0(a5)
 596:	00f68023          	sb	a5,0(a3)
  }while((x /= base) != 0);
 59a:	0005879b          	sext.w	a5,a1
 59e:	02c5d5bb          	divuw	a1,a1,a2
 5a2:	0685                	addi	a3,a3,1
 5a4:	fec7f0e3          	bgeu	a5,a2,584 <printint+0x2a>
  if(neg)
 5a8:	00088b63          	beqz	a7,5be <printint+0x64>
    buf[i++] = '-';
 5ac:	fd040793          	addi	a5,s0,-48
 5b0:	973e                	add	a4,a4,a5
 5b2:	02d00793          	li	a5,45
 5b6:	fef70823          	sb	a5,-16(a4)
 5ba:	0028071b          	addiw	a4,a6,2

  while(--i >= 0)
 5be:	02e05863          	blez	a4,5ee <printint+0x94>
 5c2:	fc040793          	addi	a5,s0,-64
 5c6:	00e78933          	add	s2,a5,a4
 5ca:	fff78993          	addi	s3,a5,-1
 5ce:	99ba                	add	s3,s3,a4
 5d0:	377d                	addiw	a4,a4,-1
 5d2:	1702                	slli	a4,a4,0x20
 5d4:	9301                	srli	a4,a4,0x20
 5d6:	40e989b3          	sub	s3,s3,a4
    putc(fd, buf[i]);
 5da:	fff94583          	lbu	a1,-1(s2)
 5de:	8526                	mv	a0,s1
 5e0:	00000097          	auipc	ra,0x0
 5e4:	f58080e7          	jalr	-168(ra) # 538 <putc>
  while(--i >= 0)
 5e8:	197d                	addi	s2,s2,-1
 5ea:	ff3918e3          	bne	s2,s3,5da <printint+0x80>
}
 5ee:	70e2                	ld	ra,56(sp)
 5f0:	7442                	ld	s0,48(sp)
 5f2:	74a2                	ld	s1,40(sp)
 5f4:	7902                	ld	s2,32(sp)
 5f6:	69e2                	ld	s3,24(sp)
 5f8:	6121                	addi	sp,sp,64
 5fa:	8082                	ret
    x = -xx;
 5fc:	40b005bb          	negw	a1,a1
    neg = 1;
 600:	4885                	li	a7,1
    x = -xx;
 602:	bf8d                	j	574 <printint+0x1a>

0000000000000604 <vprintf>:
}

// Print to the given fd. Only understands %d, %x, %p, %s.
void
vprintf(int fd, const char *fmt, va_list ap)
{
 604:	7119                	addi	sp,sp,-128
 606:	fc86                	sd	ra,120(sp)
 608:	f8a2                	sd	s0,112(sp)
 60a:	f4a6                	sd	s1,104(sp)
 60c:	f0ca                	sd	s2,96(sp)
 60e:	ecce                	sd	s3,88(sp)
 610:	e8d2                	sd	s4,80(sp)
 612:	e4d6                	sd	s5,72(sp)
 614:	e0da                	sd	s6,64(sp)
 616:	fc5e                	sd	s7,56(sp)
 618:	f862                	sd	s8,48(sp)
 61a:	f466                	sd	s9,40(sp)
 61c:	f06a                	sd	s10,32(sp)
 61e:	ec6e                	sd	s11,24(sp)
 620:	0100                	addi	s0,sp,128
  char *s;
  int c, i, state;

  state = 0;
  for(i = 0; fmt[i]; i++){
 622:	0005c903          	lbu	s2,0(a1)
 626:	18090f63          	beqz	s2,7c4 <vprintf+0x1c0>
 62a:	8aaa                	mv	s5,a0
 62c:	8b32                	mv	s6,a2
 62e:	00158493          	addi	s1,a1,1
  state = 0;
 632:	4981                	li	s3,0
      if(c == '%'){
        state = '%';
      } else {
        putc(fd, c);
      }
    } else if(state == '%'){
 634:	02500a13          	li	s4,37
      if(c == 'd'){
 638:	06400c13          	li	s8,100
        printint(fd, va_arg(ap, int), 10, 1);
      } else if(c == 'l') {
 63c:	06c00c93          	li	s9,108
        printint(fd, va_arg(ap, uint64), 10, 0);
      } else if(c == 'x') {
 640:	07800d13          	li	s10,120
        printint(fd, va_arg(ap, int), 16, 0);
      } else if(c == 'p') {
 644:	07000d93          	li	s11,112
    putc(fd, digits[x >> (sizeof(uint64) * 8 - 4)]);
 648:	00000b97          	auipc	s7,0x0
 64c:	3d8b8b93          	addi	s7,s7,984 # a20 <digits>
 650:	a839                	j	66e <vprintf+0x6a>
        putc(fd, c);
 652:	85ca                	mv	a1,s2
 654:	8556                	mv	a0,s5
 656:	00000097          	auipc	ra,0x0
 65a:	ee2080e7          	jalr	-286(ra) # 538 <putc>
 65e:	a019                	j	664 <vprintf+0x60>
    } else if(state == '%'){
 660:	01498f63          	beq	s3,s4,67e <vprintf+0x7a>
  for(i = 0; fmt[i]; i++){
 664:	0485                	addi	s1,s1,1
 666:	fff4c903          	lbu	s2,-1(s1)
 66a:	14090d63          	beqz	s2,7c4 <vprintf+0x1c0>
    c = fmt[i] & 0xff;
 66e:	0009079b          	sext.w	a5,s2
    if(state == 0){
 672:	fe0997e3          	bnez	s3,660 <vprintf+0x5c>
      if(c == '%'){
 676:	fd479ee3          	bne	a5,s4,652 <vprintf+0x4e>
        state = '%';
 67a:	89be                	mv	s3,a5
 67c:	b7e5                	j	664 <vprintf+0x60>
      if(c == 'd'){
 67e:	05878063          	beq	a5,s8,6be <vprintf+0xba>
      } else if(c == 'l') {
 682:	05978c63          	beq	a5,s9,6da <vprintf+0xd6>
      } else if(c == 'x') {
 686:	07a78863          	beq	a5,s10,6f6 <vprintf+0xf2>
      } else if(c == 'p') {
 68a:	09b78463          	beq	a5,s11,712 <vprintf+0x10e>
        printptr(fd, va_arg(ap, uint64));
      } else if(c == 's'){
 68e:	07300713          	li	a4,115
 692:	0ce78663          	beq	a5,a4,75e <vprintf+0x15a>
          s = "(null)";
        while(*s != 0){
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
 696:	06300713          	li	a4,99
 69a:	0ee78e63          	beq	a5,a4,796 <vprintf+0x192>
        putc(fd, va_arg(ap, uint));
      } else if(c == '%'){
 69e:	11478863          	beq	a5,s4,7ae <vprintf+0x1aa>
        putc(fd, c);
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
 6a2:	85d2                	mv	a1,s4
 6a4:	8556                	mv	a0,s5
 6a6:	00000097          	auipc	ra,0x0
 6aa:	e92080e7          	jalr	-366(ra) # 538 <putc>
        putc(fd, c);
 6ae:	85ca                	mv	a1,s2
 6b0:	8556                	mv	a0,s5
 6b2:	00000097          	auipc	ra,0x0
 6b6:	e86080e7          	jalr	-378(ra) # 538 <putc>
      }
      state = 0;
 6ba:	4981                	li	s3,0
 6bc:	b765                	j	664 <vprintf+0x60>
        printint(fd, va_arg(ap, int), 10, 1);
 6be:	008b0913          	addi	s2,s6,8
 6c2:	4685                	li	a3,1
 6c4:	4629                	li	a2,10
 6c6:	000b2583          	lw	a1,0(s6)
 6ca:	8556                	mv	a0,s5
 6cc:	00000097          	auipc	ra,0x0
 6d0:	e8e080e7          	jalr	-370(ra) # 55a <printint>
 6d4:	8b4a                	mv	s6,s2
      state = 0;
 6d6:	4981                	li	s3,0
 6d8:	b771                	j	664 <vprintf+0x60>
        printint(fd, va_arg(ap, uint64), 10, 0);
 6da:	008b0913          	addi	s2,s6,8
 6de:	4681                	li	a3,0
 6e0:	4629                	li	a2,10
 6e2:	000b2583          	lw	a1,0(s6)
 6e6:	8556                	mv	a0,s5
 6e8:	00000097          	auipc	ra,0x0
 6ec:	e72080e7          	jalr	-398(ra) # 55a <printint>
 6f0:	8b4a                	mv	s6,s2
      state = 0;
 6f2:	4981                	li	s3,0
 6f4:	bf85                	j	664 <vprintf+0x60>
        printint(fd, va_arg(ap, int), 16, 0);
 6f6:	008b0913          	addi	s2,s6,8
 6fa:	4681                	li	a3,0
 6fc:	4641                	li	a2,16
 6fe:	000b2583          	lw	a1,0(s6)
 702:	8556                	mv	a0,s5
 704:	00000097          	auipc	ra,0x0
 708:	e56080e7          	jalr	-426(ra) # 55a <printint>
 70c:	8b4a                	mv	s6,s2
      state = 0;
 70e:	4981                	li	s3,0
 710:	bf91                	j	664 <vprintf+0x60>
        printptr(fd, va_arg(ap, uint64));
 712:	008b0793          	addi	a5,s6,8
 716:	f8f43423          	sd	a5,-120(s0)
 71a:	000b3983          	ld	s3,0(s6)
  putc(fd, '0');
 71e:	03000593          	li	a1,48
 722:	8556                	mv	a0,s5
 724:	00000097          	auipc	ra,0x0
 728:	e14080e7          	jalr	-492(ra) # 538 <putc>
  putc(fd, 'x');
 72c:	85ea                	mv	a1,s10
 72e:	8556                	mv	a0,s5
 730:	00000097          	auipc	ra,0x0
 734:	e08080e7          	jalr	-504(ra) # 538 <putc>
 738:	4941                	li	s2,16
    putc(fd, digits[x >> (sizeof(uint64) * 8 - 4)]);
 73a:	03c9d793          	srli	a5,s3,0x3c
 73e:	97de                	add	a5,a5,s7
 740:	0007c583          	lbu	a1,0(a5)
 744:	8556                	mv	a0,s5
 746:	00000097          	auipc	ra,0x0
 74a:	df2080e7          	jalr	-526(ra) # 538 <putc>
  for (i = 0; i < (sizeof(uint64) * 2); i++, x <<= 4)
 74e:	0992                	slli	s3,s3,0x4
 750:	397d                	addiw	s2,s2,-1
 752:	fe0914e3          	bnez	s2,73a <vprintf+0x136>
        printptr(fd, va_arg(ap, uint64));
 756:	f8843b03          	ld	s6,-120(s0)
      state = 0;
 75a:	4981                	li	s3,0
 75c:	b721                	j	664 <vprintf+0x60>
        s = va_arg(ap, char*);
 75e:	008b0993          	addi	s3,s6,8
 762:	000b3903          	ld	s2,0(s6)
        if(s == 0)
 766:	02090163          	beqz	s2,788 <vprintf+0x184>
        while(*s != 0){
 76a:	00094583          	lbu	a1,0(s2)
 76e:	c9a1                	beqz	a1,7be <vprintf+0x1ba>
          putc(fd, *s);
 770:	8556                	mv	a0,s5
 772:	00000097          	auipc	ra,0x0
 776:	dc6080e7          	jalr	-570(ra) # 538 <putc>
          s++;
 77a:	0905                	addi	s2,s2,1
        while(*s != 0){
 77c:	00094583          	lbu	a1,0(s2)
 780:	f9e5                	bnez	a1,770 <vprintf+0x16c>
        s = va_arg(ap, char*);
 782:	8b4e                	mv	s6,s3
      state = 0;
 784:	4981                	li	s3,0
 786:	bdf9                	j	664 <vprintf+0x60>
          s = "(null)";
 788:	00000917          	auipc	s2,0x0
 78c:	29090913          	addi	s2,s2,656 # a18 <malloc+0x14a>
        while(*s != 0){
 790:	02800593          	li	a1,40
 794:	bff1                	j	770 <vprintf+0x16c>
        putc(fd, va_arg(ap, uint));
 796:	008b0913          	addi	s2,s6,8
 79a:	000b4583          	lbu	a1,0(s6)
 79e:	8556                	mv	a0,s5
 7a0:	00000097          	auipc	ra,0x0
 7a4:	d98080e7          	jalr	-616(ra) # 538 <putc>
 7a8:	8b4a                	mv	s6,s2
      state = 0;
 7aa:	4981                	li	s3,0
 7ac:	bd65                	j	664 <vprintf+0x60>
        putc(fd, c);
 7ae:	85d2                	mv	a1,s4
 7b0:	8556                	mv	a0,s5
 7b2:	00000097          	auipc	ra,0x0
 7b6:	d86080e7          	jalr	-634(ra) # 538 <putc>
      state = 0;
 7ba:	4981                	li	s3,0
 7bc:	b565                	j	664 <vprintf+0x60>
        s = va_arg(ap, char*);
 7be:	8b4e                	mv	s6,s3
      state = 0;
 7c0:	4981                	li	s3,0
 7c2:	b54d                	j	664 <vprintf+0x60>
    }
  }
}
 7c4:	70e6                	ld	ra,120(sp)
 7c6:	7446                	ld	s0,112(sp)
 7c8:	74a6                	ld	s1,104(sp)
 7ca:	7906                	ld	s2,96(sp)
 7cc:	69e6                	ld	s3,88(sp)
 7ce:	6a46                	ld	s4,80(sp)
 7d0:	6aa6                	ld	s5,72(sp)
 7d2:	6b06                	ld	s6,64(sp)
 7d4:	7be2                	ld	s7,56(sp)
 7d6:	7c42                	ld	s8,48(sp)
 7d8:	7ca2                	ld	s9,40(sp)
 7da:	7d02                	ld	s10,32(sp)
 7dc:	6de2                	ld	s11,24(sp)
 7de:	6109                	addi	sp,sp,128
 7e0:	8082                	ret

00000000000007e2 <fprintf>:

void
fprintf(int fd, const char *fmt, ...)
{
 7e2:	715d                	addi	sp,sp,-80
 7e4:	ec06                	sd	ra,24(sp)
 7e6:	e822                	sd	s0,16(sp)
 7e8:	1000                	addi	s0,sp,32
 7ea:	e010                	sd	a2,0(s0)
 7ec:	e414                	sd	a3,8(s0)
 7ee:	e818                	sd	a4,16(s0)
 7f0:	ec1c                	sd	a5,24(s0)
 7f2:	03043023          	sd	a6,32(s0)
 7f6:	03143423          	sd	a7,40(s0)
  va_list ap;

  va_start(ap, fmt);
 7fa:	fe843423          	sd	s0,-24(s0)
  vprintf(fd, fmt, ap);
 7fe:	8622                	mv	a2,s0
 800:	00000097          	auipc	ra,0x0
 804:	e04080e7          	jalr	-508(ra) # 604 <vprintf>
}
 808:	60e2                	ld	ra,24(sp)
 80a:	6442                	ld	s0,16(sp)
 80c:	6161                	addi	sp,sp,80
 80e:	8082                	ret

0000000000000810 <printf>:

void
printf(const char *fmt, ...)
{
 810:	711d                	addi	sp,sp,-96
 812:	ec06                	sd	ra,24(sp)
 814:	e822                	sd	s0,16(sp)
 816:	1000                	addi	s0,sp,32
 818:	e40c                	sd	a1,8(s0)
 81a:	e810                	sd	a2,16(s0)
 81c:	ec14                	sd	a3,24(s0)
 81e:	f018                	sd	a4,32(s0)
 820:	f41c                	sd	a5,40(s0)
 822:	03043823          	sd	a6,48(s0)
 826:	03143c23          	sd	a7,56(s0)
  va_list ap;

  va_start(ap, fmt);
 82a:	00840613          	addi	a2,s0,8
 82e:	fec43423          	sd	a2,-24(s0)
  vprintf(1, fmt, ap);
 832:	85aa                	mv	a1,a0
 834:	4505                	li	a0,1
 836:	00000097          	auipc	ra,0x0
 83a:	dce080e7          	jalr	-562(ra) # 604 <vprintf>
}
 83e:	60e2                	ld	ra,24(sp)
 840:	6442                	ld	s0,16(sp)
 842:	6125                	addi	sp,sp,96
 844:	8082                	ret

0000000000000846 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 846:	1141                	addi	sp,sp,-16
 848:	e422                	sd	s0,8(sp)
 84a:	0800                	addi	s0,sp,16
  Header *bp, *p;

  bp = (Header*)ap - 1;
 84c:	ff050693          	addi	a3,a0,-16
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 850:	00000797          	auipc	a5,0x0
 854:	1e87b783          	ld	a5,488(a5) # a38 <freep>
 858:	a805                	j	888 <free+0x42>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
      break;
  if(bp + bp->s.size == p->s.ptr){
    bp->s.size += p->s.ptr->s.size;
 85a:	4618                	lw	a4,8(a2)
 85c:	9db9                	addw	a1,a1,a4
 85e:	feb52c23          	sw	a1,-8(a0)
    bp->s.ptr = p->s.ptr->s.ptr;
 862:	6398                	ld	a4,0(a5)
 864:	6318                	ld	a4,0(a4)
 866:	fee53823          	sd	a4,-16(a0)
 86a:	a091                	j	8ae <free+0x68>
  } else
    bp->s.ptr = p->s.ptr;
  if(p + p->s.size == bp){
    p->s.size += bp->s.size;
 86c:	ff852703          	lw	a4,-8(a0)
 870:	9e39                	addw	a2,a2,a4
 872:	c790                	sw	a2,8(a5)
    p->s.ptr = bp->s.ptr;
 874:	ff053703          	ld	a4,-16(a0)
 878:	e398                	sd	a4,0(a5)
 87a:	a099                	j	8c0 <free+0x7a>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 87c:	6398                	ld	a4,0(a5)
 87e:	00e7e463          	bltu	a5,a4,886 <free+0x40>
 882:	00e6ea63          	bltu	a3,a4,896 <free+0x50>
{
 886:	87ba                	mv	a5,a4
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 888:	fed7fae3          	bgeu	a5,a3,87c <free+0x36>
 88c:	6398                	ld	a4,0(a5)
 88e:	00e6e463          	bltu	a3,a4,896 <free+0x50>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 892:	fee7eae3          	bltu	a5,a4,886 <free+0x40>
  if(bp + bp->s.size == p->s.ptr){
 896:	ff852583          	lw	a1,-8(a0)
 89a:	6390                	ld	a2,0(a5)
 89c:	02059713          	slli	a4,a1,0x20
 8a0:	9301                	srli	a4,a4,0x20
 8a2:	0712                	slli	a4,a4,0x4
 8a4:	9736                	add	a4,a4,a3
 8a6:	fae60ae3          	beq	a2,a4,85a <free+0x14>
    bp->s.ptr = p->s.ptr;
 8aa:	fec53823          	sd	a2,-16(a0)
  if(p + p->s.size == bp){
 8ae:	4790                	lw	a2,8(a5)
 8b0:	02061713          	slli	a4,a2,0x20
 8b4:	9301                	srli	a4,a4,0x20
 8b6:	0712                	slli	a4,a4,0x4
 8b8:	973e                	add	a4,a4,a5
 8ba:	fae689e3          	beq	a3,a4,86c <free+0x26>
  } else
    p->s.ptr = bp;
 8be:	e394                	sd	a3,0(a5)
  freep = p;
 8c0:	00000717          	auipc	a4,0x0
 8c4:	16f73c23          	sd	a5,376(a4) # a38 <freep>
}
 8c8:	6422                	ld	s0,8(sp)
 8ca:	0141                	addi	sp,sp,16
 8cc:	8082                	ret

00000000000008ce <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
 8ce:	7139                	addi	sp,sp,-64
 8d0:	fc06                	sd	ra,56(sp)
 8d2:	f822                	sd	s0,48(sp)
 8d4:	f426                	sd	s1,40(sp)
 8d6:	f04a                	sd	s2,32(sp)
 8d8:	ec4e                	sd	s3,24(sp)
 8da:	e852                	sd	s4,16(sp)
 8dc:	e456                	sd	s5,8(sp)
 8de:	e05a                	sd	s6,0(sp)
 8e0:	0080                	addi	s0,sp,64
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 8e2:	02051493          	slli	s1,a0,0x20
 8e6:	9081                	srli	s1,s1,0x20
 8e8:	04bd                	addi	s1,s1,15
 8ea:	8091                	srli	s1,s1,0x4
 8ec:	0014899b          	addiw	s3,s1,1
 8f0:	0485                	addi	s1,s1,1
  if((prevp = freep) == 0){
 8f2:	00000517          	auipc	a0,0x0
 8f6:	14653503          	ld	a0,326(a0) # a38 <freep>
 8fa:	c515                	beqz	a0,926 <malloc+0x58>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 8fc:	611c                	ld	a5,0(a0)
    if(p->s.size >= nunits){
 8fe:	4798                	lw	a4,8(a5)
 900:	02977f63          	bgeu	a4,s1,93e <malloc+0x70>
 904:	8a4e                	mv	s4,s3
 906:	0009871b          	sext.w	a4,s3
 90a:	6685                	lui	a3,0x1
 90c:	00d77363          	bgeu	a4,a3,912 <malloc+0x44>
 910:	6a05                	lui	s4,0x1
 912:	000a0b1b          	sext.w	s6,s4
  p = sbrk(nu * sizeof(Header));
 916:	004a1a1b          	slliw	s4,s4,0x4
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
 91a:	00000917          	auipc	s2,0x0
 91e:	11e90913          	addi	s2,s2,286 # a38 <freep>
  if(p == (char*)-1)
 922:	5afd                	li	s5,-1
 924:	a88d                	j	996 <malloc+0xc8>
    base.s.ptr = freep = prevp = &base;
 926:	00000797          	auipc	a5,0x0
 92a:	11a78793          	addi	a5,a5,282 # a40 <base>
 92e:	00000717          	auipc	a4,0x0
 932:	10f73523          	sd	a5,266(a4) # a38 <freep>
 936:	e39c                	sd	a5,0(a5)
    base.s.size = 0;
 938:	0007a423          	sw	zero,8(a5)
    if(p->s.size >= nunits){
 93c:	b7e1                	j	904 <malloc+0x36>
      if(p->s.size == nunits)
 93e:	02e48b63          	beq	s1,a4,974 <malloc+0xa6>
        p->s.size -= nunits;
 942:	4137073b          	subw	a4,a4,s3
 946:	c798                	sw	a4,8(a5)
        p += p->s.size;
 948:	1702                	slli	a4,a4,0x20
 94a:	9301                	srli	a4,a4,0x20
 94c:	0712                	slli	a4,a4,0x4
 94e:	97ba                	add	a5,a5,a4
        p->s.size = nunits;
 950:	0137a423          	sw	s3,8(a5)
      freep = prevp;
 954:	00000717          	auipc	a4,0x0
 958:	0ea73223          	sd	a0,228(a4) # a38 <freep>
      return (void*)(p + 1);
 95c:	01078513          	addi	a0,a5,16
      if((p = morecore(nunits)) == 0)
        return 0;
  }
}
 960:	70e2                	ld	ra,56(sp)
 962:	7442                	ld	s0,48(sp)
 964:	74a2                	ld	s1,40(sp)
 966:	7902                	ld	s2,32(sp)
 968:	69e2                	ld	s3,24(sp)
 96a:	6a42                	ld	s4,16(sp)
 96c:	6aa2                	ld	s5,8(sp)
 96e:	6b02                	ld	s6,0(sp)
 970:	6121                	addi	sp,sp,64
 972:	8082                	ret
        prevp->s.ptr = p->s.ptr;
 974:	6398                	ld	a4,0(a5)
 976:	e118                	sd	a4,0(a0)
 978:	bff1                	j	954 <malloc+0x86>
  hp->s.size = nu;
 97a:	01652423          	sw	s6,8(a0)
  free((void*)(hp + 1));
 97e:	0541                	addi	a0,a0,16
 980:	00000097          	auipc	ra,0x0
 984:	ec6080e7          	jalr	-314(ra) # 846 <free>
  return freep;
 988:	00093503          	ld	a0,0(s2)
      if((p = morecore(nunits)) == 0)
 98c:	d971                	beqz	a0,960 <malloc+0x92>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 98e:	611c                	ld	a5,0(a0)
    if(p->s.size >= nunits){
 990:	4798                	lw	a4,8(a5)
 992:	fa9776e3          	bgeu	a4,s1,93e <malloc+0x70>
    if(p == freep)
 996:	00093703          	ld	a4,0(s2)
 99a:	853e                	mv	a0,a5
 99c:	fef719e3          	bne	a4,a5,98e <malloc+0xc0>
  p = sbrk(nu * sizeof(Header));
 9a0:	8552                	mv	a0,s4
 9a2:	00000097          	auipc	ra,0x0
 9a6:	b7e080e7          	jalr	-1154(ra) # 520 <sbrk>
  if(p == (char*)-1)
 9aa:	fd5518e3          	bne	a0,s5,97a <malloc+0xac>
        return 0;
 9ae:	4501                	li	a0,0
 9b0:	bf45                	j	960 <malloc+0x92>
