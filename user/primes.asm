
user/_primes:     file format elf64-littleriscv


Disassembly of section .text:

0000000000000000 <work>:
#include "kernel/types.h"
#include "kernel/stat.h"
#include "user/user.h"

void work(int fd) {
   0:	715d                	addi	sp,sp,-80
   2:	e486                	sd	ra,72(sp)
   4:	e0a2                	sd	s0,64(sp)
   6:	fc26                	sd	s1,56(sp)
   8:	f84a                	sd	s2,48(sp)
   a:	f44e                	sd	s3,40(sp)
   c:	f052                	sd	s4,32(sp)
   e:	0880                	addi	s0,sp,80
  10:	892a                	mv	s2,a0
  int num;
  int ret = read(fd, &num, sizeof(num));
  12:	4611                	li	a2,4
  14:	fcc40593          	addi	a1,s0,-52
  18:	00000097          	auipc	ra,0x0
  1c:	440080e7          	jalr	1088(ra) # 458 <read>
  int nxt[2] = {};
  20:	fc043023          	sd	zero,-64(s0)
  int n;
  int first = 1; // true if nothing needs to be passed to the right

  if (ret == 0) goto END;
  24:	ed11                	bnez	a0,40 <work+0x40>
  END:
  if (!first) {
    close(nxt[0]);
    close(nxt[1]);
  }
  close(fd);
  26:	854a                	mv	a0,s2
  28:	00000097          	auipc	ra,0x0
  2c:	440080e7          	jalr	1088(ra) # 468 <close>
}
  30:	60a6                	ld	ra,72(sp)
  32:	6406                	ld	s0,64(sp)
  34:	74e2                	ld	s1,56(sp)
  36:	7942                	ld	s2,48(sp)
  38:	79a2                	ld	s3,40(sp)
  3a:	7a02                	ld	s4,32(sp)
  3c:	6161                	addi	sp,sp,80
  3e:	8082                	ret
  printf("prime %d\n", num);
  40:	fcc42583          	lw	a1,-52(s0)
  44:	00001517          	auipc	a0,0x1
  48:	91c50513          	addi	a0,a0,-1764 # 960 <malloc+0xea>
  4c:	00000097          	auipc	ra,0x0
  50:	76c080e7          	jalr	1900(ra) # 7b8 <printf>
  int first = 1; // true if nothing needs to be passed to the right
  54:	4985                	li	s3,1
        first = 0;
  56:	4a01                	li	s4,0
  58:	a071                	j	e4 <work+0xe4>
          printf("cannot open pipe\n");
  5a:	00001517          	auipc	a0,0x1
  5e:	91650513          	addi	a0,a0,-1770 # 970 <malloc+0xfa>
  62:	00000097          	auipc	ra,0x0
  66:	756080e7          	jalr	1878(ra) # 7b8 <printf>
          exit(1);
  6a:	4505                	li	a0,1
  6c:	00000097          	auipc	ra,0x0
  70:	3d4080e7          	jalr	980(ra) # 440 <exit>
          printf("cannot fork\n");
  74:	00001517          	auipc	a0,0x1
  78:	91450513          	addi	a0,a0,-1772 # 988 <malloc+0x112>
  7c:	00000097          	auipc	ra,0x0
  80:	73c080e7          	jalr	1852(ra) # 7b8 <printf>
          exit(1);
  84:	4505                	li	a0,1
  86:	00000097          	auipc	ra,0x0
  8a:	3ba080e7          	jalr	954(ra) # 440 <exit>
          close(fd);
  8e:	854a                	mv	a0,s2
  90:	00000097          	auipc	ra,0x0
  94:	3d8080e7          	jalr	984(ra) # 468 <close>
          close(nxt[1]);
  98:	fc442503          	lw	a0,-60(s0)
  9c:	00000097          	auipc	ra,0x0
  a0:	3cc080e7          	jalr	972(ra) # 468 <close>
          work(nxt[0]);
  a4:	fc042503          	lw	a0,-64(s0)
  a8:	00000097          	auipc	ra,0x0
  ac:	f58080e7          	jalr	-168(ra) # 0 <work>
          return;
  b0:	b741                	j	30 <work+0x30>
  if (!first) {
  b2:	f6099ae3          	bnez	s3,26 <work+0x26>
    close(nxt[0]);
  b6:	fc042503          	lw	a0,-64(s0)
  ba:	00000097          	auipc	ra,0x0
  be:	3ae080e7          	jalr	942(ra) # 468 <close>
    close(nxt[1]);
  c2:	fc442503          	lw	a0,-60(s0)
  c6:	00000097          	auipc	ra,0x0
  ca:	3a2080e7          	jalr	930(ra) # 468 <close>
  ce:	bfa1                	j	26 <work+0x26>
      write(nxt[1], &x, sizeof(x));
  d0:	4611                	li	a2,4
  d2:	fbc40593          	addi	a1,s0,-68
  d6:	fc442503          	lw	a0,-60(s0)
  da:	00000097          	auipc	ra,0x0
  de:	386080e7          	jalr	902(ra) # 460 <write>
  } while(n);
  e2:	d8e1                	beqz	s1,b2 <work+0xb2>
    n = read(fd, &x, sizeof(x));
  e4:	4611                	li	a2,4
  e6:	fbc40593          	addi	a1,s0,-68
  ea:	854a                	mv	a0,s2
  ec:	00000097          	auipc	ra,0x0
  f0:	36c080e7          	jalr	876(ra) # 458 <read>
  f4:	84aa                	mv	s1,a0
    if (x%num) {
  f6:	fbc42783          	lw	a5,-68(s0)
  fa:	fcc42703          	lw	a4,-52(s0)
  fe:	02e7e7bb          	remw	a5,a5,a4
 102:	d3e5                	beqz	a5,e2 <work+0xe2>
      if (first) {
 104:	fc0986e3          	beqz	s3,d0 <work+0xd0>
        ret = pipe(nxt);
 108:	fc040513          	addi	a0,s0,-64
 10c:	00000097          	auipc	ra,0x0
 110:	344080e7          	jalr	836(ra) # 450 <pipe>
        if (ret < 0) {
 114:	f40543e3          	bltz	a0,5a <work+0x5a>
      write(nxt[1], &x, sizeof(x));
 118:	4611                	li	a2,4
 11a:	fbc40593          	addi	a1,s0,-68
 11e:	fc442503          	lw	a0,-60(s0)
 122:	00000097          	auipc	ra,0x0
 126:	33e080e7          	jalr	830(ra) # 460 <write>
        ret = fork();
 12a:	00000097          	auipc	ra,0x0
 12e:	30e080e7          	jalr	782(ra) # 438 <fork>
        if (ret < 0) {
 132:	f40541e3          	bltz	a0,74 <work+0x74>
        } else if (ret == 0) {
 136:	dd21                	beqz	a0,8e <work+0x8e>
        first = 0;
 138:	89d2                	mv	s3,s4
 13a:	b765                	j	e2 <work+0xe2>

000000000000013c <main>:

int
main(int argc, char *argv[])
{
 13c:	7179                	addi	sp,sp,-48
 13e:	f406                	sd	ra,40(sp)
 140:	f022                	sd	s0,32(sp)
 142:	ec26                	sd	s1,24(sp)
 144:	1800                	addi	s0,sp,48
  int fd[2];
  if (pipe(fd) < 0) {
 146:	fd840513          	addi	a0,s0,-40
 14a:	00000097          	auipc	ra,0x0
 14e:	306080e7          	jalr	774(ra) # 450 <pipe>
 152:	04054f63          	bltz	a0,1b0 <main+0x74>
    printf("cannot open pipe\n");
    exit(1);
  }
  for (int i = 2; i <= 35; i++)
 156:	4789                	li	a5,2
 158:	fcf42a23          	sw	a5,-44(s0)
 15c:	02300493          	li	s1,35
    write(fd[1], &i, sizeof(i));
 160:	4611                	li	a2,4
 162:	fd440593          	addi	a1,s0,-44
 166:	fdc42503          	lw	a0,-36(s0)
 16a:	00000097          	auipc	ra,0x0
 16e:	2f6080e7          	jalr	758(ra) # 460 <write>
  for (int i = 2; i <= 35; i++)
 172:	fd442783          	lw	a5,-44(s0)
 176:	2785                	addiw	a5,a5,1
 178:	0007871b          	sext.w	a4,a5
 17c:	fcf42a23          	sw	a5,-44(s0)
 180:	fee4d0e3          	bge	s1,a4,160 <main+0x24>
  close(fd[1]);
 184:	fdc42503          	lw	a0,-36(s0)
 188:	00000097          	auipc	ra,0x0
 18c:	2e0080e7          	jalr	736(ra) # 468 <close>

  work(fd[0]);
 190:	fd842503          	lw	a0,-40(s0)
 194:	00000097          	auipc	ra,0x0
 198:	e6c080e7          	jalr	-404(ra) # 0 <work>

  wait(0);
 19c:	4501                	li	a0,0
 19e:	00000097          	auipc	ra,0x0
 1a2:	2aa080e7          	jalr	682(ra) # 448 <wait>

  exit(0);
 1a6:	4501                	li	a0,0
 1a8:	00000097          	auipc	ra,0x0
 1ac:	298080e7          	jalr	664(ra) # 440 <exit>
    printf("cannot open pipe\n");
 1b0:	00000517          	auipc	a0,0x0
 1b4:	7c050513          	addi	a0,a0,1984 # 970 <malloc+0xfa>
 1b8:	00000097          	auipc	ra,0x0
 1bc:	600080e7          	jalr	1536(ra) # 7b8 <printf>
    exit(1);
 1c0:	4505                	li	a0,1
 1c2:	00000097          	auipc	ra,0x0
 1c6:	27e080e7          	jalr	638(ra) # 440 <exit>

00000000000001ca <strcpy>:
#include "kernel/fcntl.h"
#include "user/user.h"

char*
strcpy(char *s, const char *t)
{
 1ca:	1141                	addi	sp,sp,-16
 1cc:	e422                	sd	s0,8(sp)
 1ce:	0800                	addi	s0,sp,16
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
 1d0:	87aa                	mv	a5,a0
 1d2:	0585                	addi	a1,a1,1
 1d4:	0785                	addi	a5,a5,1
 1d6:	fff5c703          	lbu	a4,-1(a1)
 1da:	fee78fa3          	sb	a4,-1(a5)
 1de:	fb75                	bnez	a4,1d2 <strcpy+0x8>
    ;
  return os;
}
 1e0:	6422                	ld	s0,8(sp)
 1e2:	0141                	addi	sp,sp,16
 1e4:	8082                	ret

00000000000001e6 <strcmp>:

int
strcmp(const char *p, const char *q)
{
 1e6:	1141                	addi	sp,sp,-16
 1e8:	e422                	sd	s0,8(sp)
 1ea:	0800                	addi	s0,sp,16
  while(*p && *p == *q)
 1ec:	00054783          	lbu	a5,0(a0)
 1f0:	cb91                	beqz	a5,204 <strcmp+0x1e>
 1f2:	0005c703          	lbu	a4,0(a1)
 1f6:	00f71763          	bne	a4,a5,204 <strcmp+0x1e>
    p++, q++;
 1fa:	0505                	addi	a0,a0,1
 1fc:	0585                	addi	a1,a1,1
  while(*p && *p == *q)
 1fe:	00054783          	lbu	a5,0(a0)
 202:	fbe5                	bnez	a5,1f2 <strcmp+0xc>
  return (uchar)*p - (uchar)*q;
 204:	0005c503          	lbu	a0,0(a1)
}
 208:	40a7853b          	subw	a0,a5,a0
 20c:	6422                	ld	s0,8(sp)
 20e:	0141                	addi	sp,sp,16
 210:	8082                	ret

0000000000000212 <strlen>:

uint
strlen(const char *s)
{
 212:	1141                	addi	sp,sp,-16
 214:	e422                	sd	s0,8(sp)
 216:	0800                	addi	s0,sp,16
  int n;

  for(n = 0; s[n]; n++)
 218:	00054783          	lbu	a5,0(a0)
 21c:	cf91                	beqz	a5,238 <strlen+0x26>
 21e:	0505                	addi	a0,a0,1
 220:	87aa                	mv	a5,a0
 222:	4685                	li	a3,1
 224:	9e89                	subw	a3,a3,a0
 226:	00f6853b          	addw	a0,a3,a5
 22a:	0785                	addi	a5,a5,1
 22c:	fff7c703          	lbu	a4,-1(a5)
 230:	fb7d                	bnez	a4,226 <strlen+0x14>
    ;
  return n;
}
 232:	6422                	ld	s0,8(sp)
 234:	0141                	addi	sp,sp,16
 236:	8082                	ret
  for(n = 0; s[n]; n++)
 238:	4501                	li	a0,0
 23a:	bfe5                	j	232 <strlen+0x20>

000000000000023c <memset>:

void*
memset(void *dst, int c, uint n)
{
 23c:	1141                	addi	sp,sp,-16
 23e:	e422                	sd	s0,8(sp)
 240:	0800                	addi	s0,sp,16
  char *cdst = (char *) dst;
  int i;
  for(i = 0; i < n; i++){
 242:	ce09                	beqz	a2,25c <memset+0x20>
 244:	87aa                	mv	a5,a0
 246:	fff6071b          	addiw	a4,a2,-1
 24a:	1702                	slli	a4,a4,0x20
 24c:	9301                	srli	a4,a4,0x20
 24e:	0705                	addi	a4,a4,1
 250:	972a                	add	a4,a4,a0
    cdst[i] = c;
 252:	00b78023          	sb	a1,0(a5)
  for(i = 0; i < n; i++){
 256:	0785                	addi	a5,a5,1
 258:	fee79de3          	bne	a5,a4,252 <memset+0x16>
  }
  return dst;
}
 25c:	6422                	ld	s0,8(sp)
 25e:	0141                	addi	sp,sp,16
 260:	8082                	ret

0000000000000262 <strchr>:

char*
strchr(const char *s, char c)
{
 262:	1141                	addi	sp,sp,-16
 264:	e422                	sd	s0,8(sp)
 266:	0800                	addi	s0,sp,16
  for(; *s; s++)
 268:	00054783          	lbu	a5,0(a0)
 26c:	cb99                	beqz	a5,282 <strchr+0x20>
    if(*s == c)
 26e:	00f58763          	beq	a1,a5,27c <strchr+0x1a>
  for(; *s; s++)
 272:	0505                	addi	a0,a0,1
 274:	00054783          	lbu	a5,0(a0)
 278:	fbfd                	bnez	a5,26e <strchr+0xc>
      return (char*)s;
  return 0;
 27a:	4501                	li	a0,0
}
 27c:	6422                	ld	s0,8(sp)
 27e:	0141                	addi	sp,sp,16
 280:	8082                	ret
  return 0;
 282:	4501                	li	a0,0
 284:	bfe5                	j	27c <strchr+0x1a>

0000000000000286 <gets>:

char*
gets(char *buf, int max)
{
 286:	711d                	addi	sp,sp,-96
 288:	ec86                	sd	ra,88(sp)
 28a:	e8a2                	sd	s0,80(sp)
 28c:	e4a6                	sd	s1,72(sp)
 28e:	e0ca                	sd	s2,64(sp)
 290:	fc4e                	sd	s3,56(sp)
 292:	f852                	sd	s4,48(sp)
 294:	f456                	sd	s5,40(sp)
 296:	f05a                	sd	s6,32(sp)
 298:	ec5e                	sd	s7,24(sp)
 29a:	1080                	addi	s0,sp,96
 29c:	8baa                	mv	s7,a0
 29e:	8a2e                	mv	s4,a1
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 2a0:	892a                	mv	s2,a0
 2a2:	4481                	li	s1,0
    cc = read(0, &c, 1);
    if(cc < 1)
      break;
    buf[i++] = c;
    if(c == '\n' || c == '\r')
 2a4:	4aa9                	li	s5,10
 2a6:	4b35                	li	s6,13
  for(i=0; i+1 < max; ){
 2a8:	89a6                	mv	s3,s1
 2aa:	2485                	addiw	s1,s1,1
 2ac:	0344d863          	bge	s1,s4,2dc <gets+0x56>
    cc = read(0, &c, 1);
 2b0:	4605                	li	a2,1
 2b2:	faf40593          	addi	a1,s0,-81
 2b6:	4501                	li	a0,0
 2b8:	00000097          	auipc	ra,0x0
 2bc:	1a0080e7          	jalr	416(ra) # 458 <read>
    if(cc < 1)
 2c0:	00a05e63          	blez	a0,2dc <gets+0x56>
    buf[i++] = c;
 2c4:	faf44783          	lbu	a5,-81(s0)
 2c8:	00f90023          	sb	a5,0(s2)
    if(c == '\n' || c == '\r')
 2cc:	01578763          	beq	a5,s5,2da <gets+0x54>
 2d0:	0905                	addi	s2,s2,1
 2d2:	fd679be3          	bne	a5,s6,2a8 <gets+0x22>
  for(i=0; i+1 < max; ){
 2d6:	89a6                	mv	s3,s1
 2d8:	a011                	j	2dc <gets+0x56>
 2da:	89a6                	mv	s3,s1
      break;
  }
  buf[i] = '\0';
 2dc:	99de                	add	s3,s3,s7
 2de:	00098023          	sb	zero,0(s3)
  return buf;
}
 2e2:	855e                	mv	a0,s7
 2e4:	60e6                	ld	ra,88(sp)
 2e6:	6446                	ld	s0,80(sp)
 2e8:	64a6                	ld	s1,72(sp)
 2ea:	6906                	ld	s2,64(sp)
 2ec:	79e2                	ld	s3,56(sp)
 2ee:	7a42                	ld	s4,48(sp)
 2f0:	7aa2                	ld	s5,40(sp)
 2f2:	7b02                	ld	s6,32(sp)
 2f4:	6be2                	ld	s7,24(sp)
 2f6:	6125                	addi	sp,sp,96
 2f8:	8082                	ret

00000000000002fa <stat>:

int
stat(const char *n, struct stat *st)
{
 2fa:	1101                	addi	sp,sp,-32
 2fc:	ec06                	sd	ra,24(sp)
 2fe:	e822                	sd	s0,16(sp)
 300:	e426                	sd	s1,8(sp)
 302:	e04a                	sd	s2,0(sp)
 304:	1000                	addi	s0,sp,32
 306:	892e                	mv	s2,a1
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 308:	4581                	li	a1,0
 30a:	00000097          	auipc	ra,0x0
 30e:	176080e7          	jalr	374(ra) # 480 <open>
  if(fd < 0)
 312:	02054563          	bltz	a0,33c <stat+0x42>
 316:	84aa                	mv	s1,a0
    return -1;
  r = fstat(fd, st);
 318:	85ca                	mv	a1,s2
 31a:	00000097          	auipc	ra,0x0
 31e:	17e080e7          	jalr	382(ra) # 498 <fstat>
 322:	892a                	mv	s2,a0
  close(fd);
 324:	8526                	mv	a0,s1
 326:	00000097          	auipc	ra,0x0
 32a:	142080e7          	jalr	322(ra) # 468 <close>
  return r;
}
 32e:	854a                	mv	a0,s2
 330:	60e2                	ld	ra,24(sp)
 332:	6442                	ld	s0,16(sp)
 334:	64a2                	ld	s1,8(sp)
 336:	6902                	ld	s2,0(sp)
 338:	6105                	addi	sp,sp,32
 33a:	8082                	ret
    return -1;
 33c:	597d                	li	s2,-1
 33e:	bfc5                	j	32e <stat+0x34>

0000000000000340 <atoi>:

int
atoi(const char *s)
{
 340:	1141                	addi	sp,sp,-16
 342:	e422                	sd	s0,8(sp)
 344:	0800                	addi	s0,sp,16
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 346:	00054603          	lbu	a2,0(a0)
 34a:	fd06079b          	addiw	a5,a2,-48
 34e:	0ff7f793          	andi	a5,a5,255
 352:	4725                	li	a4,9
 354:	02f76963          	bltu	a4,a5,386 <atoi+0x46>
 358:	86aa                	mv	a3,a0
  n = 0;
 35a:	4501                	li	a0,0
  while('0' <= *s && *s <= '9')
 35c:	45a5                	li	a1,9
    n = n*10 + *s++ - '0';
 35e:	0685                	addi	a3,a3,1
 360:	0025179b          	slliw	a5,a0,0x2
 364:	9fa9                	addw	a5,a5,a0
 366:	0017979b          	slliw	a5,a5,0x1
 36a:	9fb1                	addw	a5,a5,a2
 36c:	fd07851b          	addiw	a0,a5,-48
  while('0' <= *s && *s <= '9')
 370:	0006c603          	lbu	a2,0(a3)
 374:	fd06071b          	addiw	a4,a2,-48
 378:	0ff77713          	andi	a4,a4,255
 37c:	fee5f1e3          	bgeu	a1,a4,35e <atoi+0x1e>
  return n;
}
 380:	6422                	ld	s0,8(sp)
 382:	0141                	addi	sp,sp,16
 384:	8082                	ret
  n = 0;
 386:	4501                	li	a0,0
 388:	bfe5                	j	380 <atoi+0x40>

000000000000038a <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 38a:	1141                	addi	sp,sp,-16
 38c:	e422                	sd	s0,8(sp)
 38e:	0800                	addi	s0,sp,16
  char *dst;
  const char *src;

  dst = vdst;
  src = vsrc;
  if (src > dst) {
 390:	02b57663          	bgeu	a0,a1,3bc <memmove+0x32>
    while(n-- > 0)
 394:	02c05163          	blez	a2,3b6 <memmove+0x2c>
 398:	fff6079b          	addiw	a5,a2,-1
 39c:	1782                	slli	a5,a5,0x20
 39e:	9381                	srli	a5,a5,0x20
 3a0:	0785                	addi	a5,a5,1
 3a2:	97aa                	add	a5,a5,a0
  dst = vdst;
 3a4:	872a                	mv	a4,a0
      *dst++ = *src++;
 3a6:	0585                	addi	a1,a1,1
 3a8:	0705                	addi	a4,a4,1
 3aa:	fff5c683          	lbu	a3,-1(a1)
 3ae:	fed70fa3          	sb	a3,-1(a4)
    while(n-- > 0)
 3b2:	fee79ae3          	bne	a5,a4,3a6 <memmove+0x1c>
    src += n;
    while(n-- > 0)
      *--dst = *--src;
  }
  return vdst;
}
 3b6:	6422                	ld	s0,8(sp)
 3b8:	0141                	addi	sp,sp,16
 3ba:	8082                	ret
    dst += n;
 3bc:	00c50733          	add	a4,a0,a2
    src += n;
 3c0:	95b2                	add	a1,a1,a2
    while(n-- > 0)
 3c2:	fec05ae3          	blez	a2,3b6 <memmove+0x2c>
 3c6:	fff6079b          	addiw	a5,a2,-1
 3ca:	1782                	slli	a5,a5,0x20
 3cc:	9381                	srli	a5,a5,0x20
 3ce:	fff7c793          	not	a5,a5
 3d2:	97ba                	add	a5,a5,a4
      *--dst = *--src;
 3d4:	15fd                	addi	a1,a1,-1
 3d6:	177d                	addi	a4,a4,-1
 3d8:	0005c683          	lbu	a3,0(a1)
 3dc:	00d70023          	sb	a3,0(a4)
    while(n-- > 0)
 3e0:	fee79ae3          	bne	a5,a4,3d4 <memmove+0x4a>
 3e4:	bfc9                	j	3b6 <memmove+0x2c>

00000000000003e6 <memcmp>:

int
memcmp(const void *s1, const void *s2, uint n)
{
 3e6:	1141                	addi	sp,sp,-16
 3e8:	e422                	sd	s0,8(sp)
 3ea:	0800                	addi	s0,sp,16
  const char *p1 = s1, *p2 = s2;
  while (n-- > 0) {
 3ec:	ca05                	beqz	a2,41c <memcmp+0x36>
 3ee:	fff6069b          	addiw	a3,a2,-1
 3f2:	1682                	slli	a3,a3,0x20
 3f4:	9281                	srli	a3,a3,0x20
 3f6:	0685                	addi	a3,a3,1
 3f8:	96aa                	add	a3,a3,a0
    if (*p1 != *p2) {
 3fa:	00054783          	lbu	a5,0(a0)
 3fe:	0005c703          	lbu	a4,0(a1)
 402:	00e79863          	bne	a5,a4,412 <memcmp+0x2c>
      return *p1 - *p2;
    }
    p1++;
 406:	0505                	addi	a0,a0,1
    p2++;
 408:	0585                	addi	a1,a1,1
  while (n-- > 0) {
 40a:	fed518e3          	bne	a0,a3,3fa <memcmp+0x14>
  }
  return 0;
 40e:	4501                	li	a0,0
 410:	a019                	j	416 <memcmp+0x30>
      return *p1 - *p2;
 412:	40e7853b          	subw	a0,a5,a4
}
 416:	6422                	ld	s0,8(sp)
 418:	0141                	addi	sp,sp,16
 41a:	8082                	ret
  return 0;
 41c:	4501                	li	a0,0
 41e:	bfe5                	j	416 <memcmp+0x30>

0000000000000420 <memcpy>:

void *
memcpy(void *dst, const void *src, uint n)
{
 420:	1141                	addi	sp,sp,-16
 422:	e406                	sd	ra,8(sp)
 424:	e022                	sd	s0,0(sp)
 426:	0800                	addi	s0,sp,16
  return memmove(dst, src, n);
 428:	00000097          	auipc	ra,0x0
 42c:	f62080e7          	jalr	-158(ra) # 38a <memmove>
}
 430:	60a2                	ld	ra,8(sp)
 432:	6402                	ld	s0,0(sp)
 434:	0141                	addi	sp,sp,16
 436:	8082                	ret

0000000000000438 <fork>:
# generated by usys.pl - do not edit
#include "kernel/syscall.h"
.global fork
fork:
 li a7, SYS_fork
 438:	4885                	li	a7,1
 ecall
 43a:	00000073          	ecall
 ret
 43e:	8082                	ret

0000000000000440 <exit>:
.global exit
exit:
 li a7, SYS_exit
 440:	4889                	li	a7,2
 ecall
 442:	00000073          	ecall
 ret
 446:	8082                	ret

0000000000000448 <wait>:
.global wait
wait:
 li a7, SYS_wait
 448:	488d                	li	a7,3
 ecall
 44a:	00000073          	ecall
 ret
 44e:	8082                	ret

0000000000000450 <pipe>:
.global pipe
pipe:
 li a7, SYS_pipe
 450:	4891                	li	a7,4
 ecall
 452:	00000073          	ecall
 ret
 456:	8082                	ret

0000000000000458 <read>:
.global read
read:
 li a7, SYS_read
 458:	4895                	li	a7,5
 ecall
 45a:	00000073          	ecall
 ret
 45e:	8082                	ret

0000000000000460 <write>:
.global write
write:
 li a7, SYS_write
 460:	48c1                	li	a7,16
 ecall
 462:	00000073          	ecall
 ret
 466:	8082                	ret

0000000000000468 <close>:
.global close
close:
 li a7, SYS_close
 468:	48d5                	li	a7,21
 ecall
 46a:	00000073          	ecall
 ret
 46e:	8082                	ret

0000000000000470 <kill>:
.global kill
kill:
 li a7, SYS_kill
 470:	4899                	li	a7,6
 ecall
 472:	00000073          	ecall
 ret
 476:	8082                	ret

0000000000000478 <exec>:
.global exec
exec:
 li a7, SYS_exec
 478:	489d                	li	a7,7
 ecall
 47a:	00000073          	ecall
 ret
 47e:	8082                	ret

0000000000000480 <open>:
.global open
open:
 li a7, SYS_open
 480:	48bd                	li	a7,15
 ecall
 482:	00000073          	ecall
 ret
 486:	8082                	ret

0000000000000488 <mknod>:
.global mknod
mknod:
 li a7, SYS_mknod
 488:	48c5                	li	a7,17
 ecall
 48a:	00000073          	ecall
 ret
 48e:	8082                	ret

0000000000000490 <unlink>:
.global unlink
unlink:
 li a7, SYS_unlink
 490:	48c9                	li	a7,18
 ecall
 492:	00000073          	ecall
 ret
 496:	8082                	ret

0000000000000498 <fstat>:
.global fstat
fstat:
 li a7, SYS_fstat
 498:	48a1                	li	a7,8
 ecall
 49a:	00000073          	ecall
 ret
 49e:	8082                	ret

00000000000004a0 <link>:
.global link
link:
 li a7, SYS_link
 4a0:	48cd                	li	a7,19
 ecall
 4a2:	00000073          	ecall
 ret
 4a6:	8082                	ret

00000000000004a8 <mkdir>:
.global mkdir
mkdir:
 li a7, SYS_mkdir
 4a8:	48d1                	li	a7,20
 ecall
 4aa:	00000073          	ecall
 ret
 4ae:	8082                	ret

00000000000004b0 <chdir>:
.global chdir
chdir:
 li a7, SYS_chdir
 4b0:	48a5                	li	a7,9
 ecall
 4b2:	00000073          	ecall
 ret
 4b6:	8082                	ret

00000000000004b8 <dup>:
.global dup
dup:
 li a7, SYS_dup
 4b8:	48a9                	li	a7,10
 ecall
 4ba:	00000073          	ecall
 ret
 4be:	8082                	ret

00000000000004c0 <getpid>:
.global getpid
getpid:
 li a7, SYS_getpid
 4c0:	48ad                	li	a7,11
 ecall
 4c2:	00000073          	ecall
 ret
 4c6:	8082                	ret

00000000000004c8 <sbrk>:
.global sbrk
sbrk:
 li a7, SYS_sbrk
 4c8:	48b1                	li	a7,12
 ecall
 4ca:	00000073          	ecall
 ret
 4ce:	8082                	ret

00000000000004d0 <sleep>:
.global sleep
sleep:
 li a7, SYS_sleep
 4d0:	48b5                	li	a7,13
 ecall
 4d2:	00000073          	ecall
 ret
 4d6:	8082                	ret

00000000000004d8 <uptime>:
.global uptime
uptime:
 li a7, SYS_uptime
 4d8:	48b9                	li	a7,14
 ecall
 4da:	00000073          	ecall
 ret
 4de:	8082                	ret

00000000000004e0 <putc>:

static char digits[] = "0123456789ABCDEF";

static void
putc(int fd, char c)
{
 4e0:	1101                	addi	sp,sp,-32
 4e2:	ec06                	sd	ra,24(sp)
 4e4:	e822                	sd	s0,16(sp)
 4e6:	1000                	addi	s0,sp,32
 4e8:	feb407a3          	sb	a1,-17(s0)
  write(fd, &c, 1);
 4ec:	4605                	li	a2,1
 4ee:	fef40593          	addi	a1,s0,-17
 4f2:	00000097          	auipc	ra,0x0
 4f6:	f6e080e7          	jalr	-146(ra) # 460 <write>
}
 4fa:	60e2                	ld	ra,24(sp)
 4fc:	6442                	ld	s0,16(sp)
 4fe:	6105                	addi	sp,sp,32
 500:	8082                	ret

0000000000000502 <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
 502:	7139                	addi	sp,sp,-64
 504:	fc06                	sd	ra,56(sp)
 506:	f822                	sd	s0,48(sp)
 508:	f426                	sd	s1,40(sp)
 50a:	f04a                	sd	s2,32(sp)
 50c:	ec4e                	sd	s3,24(sp)
 50e:	0080                	addi	s0,sp,64
 510:	84aa                	mv	s1,a0
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
 512:	c299                	beqz	a3,518 <printint+0x16>
 514:	0805c863          	bltz	a1,5a4 <printint+0xa2>
    neg = 1;
    x = -xx;
  } else {
    x = xx;
 518:	2581                	sext.w	a1,a1
  neg = 0;
 51a:	4881                	li	a7,0
 51c:	fc040693          	addi	a3,s0,-64
  }

  i = 0;
 520:	4701                	li	a4,0
  do{
    buf[i++] = digits[x % base];
 522:	2601                	sext.w	a2,a2
 524:	00000517          	auipc	a0,0x0
 528:	47c50513          	addi	a0,a0,1148 # 9a0 <digits>
 52c:	883a                	mv	a6,a4
 52e:	2705                	addiw	a4,a4,1
 530:	02c5f7bb          	remuw	a5,a1,a2
 534:	1782                	slli	a5,a5,0x20
 536:	9381                	srli	a5,a5,0x20
 538:	97aa                	add	a5,a5,a0
 53a:	0007c783          	lbu	a5,0(a5)
 53e:	00f68023          	sb	a5,0(a3)
  }while((x /= base) != 0);
 542:	0005879b          	sext.w	a5,a1
 546:	02c5d5bb          	divuw	a1,a1,a2
 54a:	0685                	addi	a3,a3,1
 54c:	fec7f0e3          	bgeu	a5,a2,52c <printint+0x2a>
  if(neg)
 550:	00088b63          	beqz	a7,566 <printint+0x64>
    buf[i++] = '-';
 554:	fd040793          	addi	a5,s0,-48
 558:	973e                	add	a4,a4,a5
 55a:	02d00793          	li	a5,45
 55e:	fef70823          	sb	a5,-16(a4)
 562:	0028071b          	addiw	a4,a6,2

  while(--i >= 0)
 566:	02e05863          	blez	a4,596 <printint+0x94>
 56a:	fc040793          	addi	a5,s0,-64
 56e:	00e78933          	add	s2,a5,a4
 572:	fff78993          	addi	s3,a5,-1
 576:	99ba                	add	s3,s3,a4
 578:	377d                	addiw	a4,a4,-1
 57a:	1702                	slli	a4,a4,0x20
 57c:	9301                	srli	a4,a4,0x20
 57e:	40e989b3          	sub	s3,s3,a4
    putc(fd, buf[i]);
 582:	fff94583          	lbu	a1,-1(s2)
 586:	8526                	mv	a0,s1
 588:	00000097          	auipc	ra,0x0
 58c:	f58080e7          	jalr	-168(ra) # 4e0 <putc>
  while(--i >= 0)
 590:	197d                	addi	s2,s2,-1
 592:	ff3918e3          	bne	s2,s3,582 <printint+0x80>
}
 596:	70e2                	ld	ra,56(sp)
 598:	7442                	ld	s0,48(sp)
 59a:	74a2                	ld	s1,40(sp)
 59c:	7902                	ld	s2,32(sp)
 59e:	69e2                	ld	s3,24(sp)
 5a0:	6121                	addi	sp,sp,64
 5a2:	8082                	ret
    x = -xx;
 5a4:	40b005bb          	negw	a1,a1
    neg = 1;
 5a8:	4885                	li	a7,1
    x = -xx;
 5aa:	bf8d                	j	51c <printint+0x1a>

00000000000005ac <vprintf>:
}

// Print to the given fd. Only understands %d, %x, %p, %s.
void
vprintf(int fd, const char *fmt, va_list ap)
{
 5ac:	7119                	addi	sp,sp,-128
 5ae:	fc86                	sd	ra,120(sp)
 5b0:	f8a2                	sd	s0,112(sp)
 5b2:	f4a6                	sd	s1,104(sp)
 5b4:	f0ca                	sd	s2,96(sp)
 5b6:	ecce                	sd	s3,88(sp)
 5b8:	e8d2                	sd	s4,80(sp)
 5ba:	e4d6                	sd	s5,72(sp)
 5bc:	e0da                	sd	s6,64(sp)
 5be:	fc5e                	sd	s7,56(sp)
 5c0:	f862                	sd	s8,48(sp)
 5c2:	f466                	sd	s9,40(sp)
 5c4:	f06a                	sd	s10,32(sp)
 5c6:	ec6e                	sd	s11,24(sp)
 5c8:	0100                	addi	s0,sp,128
  char *s;
  int c, i, state;

  state = 0;
  for(i = 0; fmt[i]; i++){
 5ca:	0005c903          	lbu	s2,0(a1)
 5ce:	18090f63          	beqz	s2,76c <vprintf+0x1c0>
 5d2:	8aaa                	mv	s5,a0
 5d4:	8b32                	mv	s6,a2
 5d6:	00158493          	addi	s1,a1,1
  state = 0;
 5da:	4981                	li	s3,0
      if(c == '%'){
        state = '%';
      } else {
        putc(fd, c);
      }
    } else if(state == '%'){
 5dc:	02500a13          	li	s4,37
      if(c == 'd'){
 5e0:	06400c13          	li	s8,100
        printint(fd, va_arg(ap, int), 10, 1);
      } else if(c == 'l') {
 5e4:	06c00c93          	li	s9,108
        printint(fd, va_arg(ap, uint64), 10, 0);
      } else if(c == 'x') {
 5e8:	07800d13          	li	s10,120
        printint(fd, va_arg(ap, int), 16, 0);
      } else if(c == 'p') {
 5ec:	07000d93          	li	s11,112
    putc(fd, digits[x >> (sizeof(uint64) * 8 - 4)]);
 5f0:	00000b97          	auipc	s7,0x0
 5f4:	3b0b8b93          	addi	s7,s7,944 # 9a0 <digits>
 5f8:	a839                	j	616 <vprintf+0x6a>
        putc(fd, c);
 5fa:	85ca                	mv	a1,s2
 5fc:	8556                	mv	a0,s5
 5fe:	00000097          	auipc	ra,0x0
 602:	ee2080e7          	jalr	-286(ra) # 4e0 <putc>
 606:	a019                	j	60c <vprintf+0x60>
    } else if(state == '%'){
 608:	01498f63          	beq	s3,s4,626 <vprintf+0x7a>
  for(i = 0; fmt[i]; i++){
 60c:	0485                	addi	s1,s1,1
 60e:	fff4c903          	lbu	s2,-1(s1)
 612:	14090d63          	beqz	s2,76c <vprintf+0x1c0>
    c = fmt[i] & 0xff;
 616:	0009079b          	sext.w	a5,s2
    if(state == 0){
 61a:	fe0997e3          	bnez	s3,608 <vprintf+0x5c>
      if(c == '%'){
 61e:	fd479ee3          	bne	a5,s4,5fa <vprintf+0x4e>
        state = '%';
 622:	89be                	mv	s3,a5
 624:	b7e5                	j	60c <vprintf+0x60>
      if(c == 'd'){
 626:	05878063          	beq	a5,s8,666 <vprintf+0xba>
      } else if(c == 'l') {
 62a:	05978c63          	beq	a5,s9,682 <vprintf+0xd6>
      } else if(c == 'x') {
 62e:	07a78863          	beq	a5,s10,69e <vprintf+0xf2>
      } else if(c == 'p') {
 632:	09b78463          	beq	a5,s11,6ba <vprintf+0x10e>
        printptr(fd, va_arg(ap, uint64));
      } else if(c == 's'){
 636:	07300713          	li	a4,115
 63a:	0ce78663          	beq	a5,a4,706 <vprintf+0x15a>
          s = "(null)";
        while(*s != 0){
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
 63e:	06300713          	li	a4,99
 642:	0ee78e63          	beq	a5,a4,73e <vprintf+0x192>
        putc(fd, va_arg(ap, uint));
      } else if(c == '%'){
 646:	11478863          	beq	a5,s4,756 <vprintf+0x1aa>
        putc(fd, c);
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
 64a:	85d2                	mv	a1,s4
 64c:	8556                	mv	a0,s5
 64e:	00000097          	auipc	ra,0x0
 652:	e92080e7          	jalr	-366(ra) # 4e0 <putc>
        putc(fd, c);
 656:	85ca                	mv	a1,s2
 658:	8556                	mv	a0,s5
 65a:	00000097          	auipc	ra,0x0
 65e:	e86080e7          	jalr	-378(ra) # 4e0 <putc>
      }
      state = 0;
 662:	4981                	li	s3,0
 664:	b765                	j	60c <vprintf+0x60>
        printint(fd, va_arg(ap, int), 10, 1);
 666:	008b0913          	addi	s2,s6,8
 66a:	4685                	li	a3,1
 66c:	4629                	li	a2,10
 66e:	000b2583          	lw	a1,0(s6)
 672:	8556                	mv	a0,s5
 674:	00000097          	auipc	ra,0x0
 678:	e8e080e7          	jalr	-370(ra) # 502 <printint>
 67c:	8b4a                	mv	s6,s2
      state = 0;
 67e:	4981                	li	s3,0
 680:	b771                	j	60c <vprintf+0x60>
        printint(fd, va_arg(ap, uint64), 10, 0);
 682:	008b0913          	addi	s2,s6,8
 686:	4681                	li	a3,0
 688:	4629                	li	a2,10
 68a:	000b2583          	lw	a1,0(s6)
 68e:	8556                	mv	a0,s5
 690:	00000097          	auipc	ra,0x0
 694:	e72080e7          	jalr	-398(ra) # 502 <printint>
 698:	8b4a                	mv	s6,s2
      state = 0;
 69a:	4981                	li	s3,0
 69c:	bf85                	j	60c <vprintf+0x60>
        printint(fd, va_arg(ap, int), 16, 0);
 69e:	008b0913          	addi	s2,s6,8
 6a2:	4681                	li	a3,0
 6a4:	4641                	li	a2,16
 6a6:	000b2583          	lw	a1,0(s6)
 6aa:	8556                	mv	a0,s5
 6ac:	00000097          	auipc	ra,0x0
 6b0:	e56080e7          	jalr	-426(ra) # 502 <printint>
 6b4:	8b4a                	mv	s6,s2
      state = 0;
 6b6:	4981                	li	s3,0
 6b8:	bf91                	j	60c <vprintf+0x60>
        printptr(fd, va_arg(ap, uint64));
 6ba:	008b0793          	addi	a5,s6,8
 6be:	f8f43423          	sd	a5,-120(s0)
 6c2:	000b3983          	ld	s3,0(s6)
  putc(fd, '0');
 6c6:	03000593          	li	a1,48
 6ca:	8556                	mv	a0,s5
 6cc:	00000097          	auipc	ra,0x0
 6d0:	e14080e7          	jalr	-492(ra) # 4e0 <putc>
  putc(fd, 'x');
 6d4:	85ea                	mv	a1,s10
 6d6:	8556                	mv	a0,s5
 6d8:	00000097          	auipc	ra,0x0
 6dc:	e08080e7          	jalr	-504(ra) # 4e0 <putc>
 6e0:	4941                	li	s2,16
    putc(fd, digits[x >> (sizeof(uint64) * 8 - 4)]);
 6e2:	03c9d793          	srli	a5,s3,0x3c
 6e6:	97de                	add	a5,a5,s7
 6e8:	0007c583          	lbu	a1,0(a5)
 6ec:	8556                	mv	a0,s5
 6ee:	00000097          	auipc	ra,0x0
 6f2:	df2080e7          	jalr	-526(ra) # 4e0 <putc>
  for (i = 0; i < (sizeof(uint64) * 2); i++, x <<= 4)
 6f6:	0992                	slli	s3,s3,0x4
 6f8:	397d                	addiw	s2,s2,-1
 6fa:	fe0914e3          	bnez	s2,6e2 <vprintf+0x136>
        printptr(fd, va_arg(ap, uint64));
 6fe:	f8843b03          	ld	s6,-120(s0)
      state = 0;
 702:	4981                	li	s3,0
 704:	b721                	j	60c <vprintf+0x60>
        s = va_arg(ap, char*);
 706:	008b0993          	addi	s3,s6,8
 70a:	000b3903          	ld	s2,0(s6)
        if(s == 0)
 70e:	02090163          	beqz	s2,730 <vprintf+0x184>
        while(*s != 0){
 712:	00094583          	lbu	a1,0(s2)
 716:	c9a1                	beqz	a1,766 <vprintf+0x1ba>
          putc(fd, *s);
 718:	8556                	mv	a0,s5
 71a:	00000097          	auipc	ra,0x0
 71e:	dc6080e7          	jalr	-570(ra) # 4e0 <putc>
          s++;
 722:	0905                	addi	s2,s2,1
        while(*s != 0){
 724:	00094583          	lbu	a1,0(s2)
 728:	f9e5                	bnez	a1,718 <vprintf+0x16c>
        s = va_arg(ap, char*);
 72a:	8b4e                	mv	s6,s3
      state = 0;
 72c:	4981                	li	s3,0
 72e:	bdf9                	j	60c <vprintf+0x60>
          s = "(null)";
 730:	00000917          	auipc	s2,0x0
 734:	26890913          	addi	s2,s2,616 # 998 <malloc+0x122>
        while(*s != 0){
 738:	02800593          	li	a1,40
 73c:	bff1                	j	718 <vprintf+0x16c>
        putc(fd, va_arg(ap, uint));
 73e:	008b0913          	addi	s2,s6,8
 742:	000b4583          	lbu	a1,0(s6)
 746:	8556                	mv	a0,s5
 748:	00000097          	auipc	ra,0x0
 74c:	d98080e7          	jalr	-616(ra) # 4e0 <putc>
 750:	8b4a                	mv	s6,s2
      state = 0;
 752:	4981                	li	s3,0
 754:	bd65                	j	60c <vprintf+0x60>
        putc(fd, c);
 756:	85d2                	mv	a1,s4
 758:	8556                	mv	a0,s5
 75a:	00000097          	auipc	ra,0x0
 75e:	d86080e7          	jalr	-634(ra) # 4e0 <putc>
      state = 0;
 762:	4981                	li	s3,0
 764:	b565                	j	60c <vprintf+0x60>
        s = va_arg(ap, char*);
 766:	8b4e                	mv	s6,s3
      state = 0;
 768:	4981                	li	s3,0
 76a:	b54d                	j	60c <vprintf+0x60>
    }
  }
}
 76c:	70e6                	ld	ra,120(sp)
 76e:	7446                	ld	s0,112(sp)
 770:	74a6                	ld	s1,104(sp)
 772:	7906                	ld	s2,96(sp)
 774:	69e6                	ld	s3,88(sp)
 776:	6a46                	ld	s4,80(sp)
 778:	6aa6                	ld	s5,72(sp)
 77a:	6b06                	ld	s6,64(sp)
 77c:	7be2                	ld	s7,56(sp)
 77e:	7c42                	ld	s8,48(sp)
 780:	7ca2                	ld	s9,40(sp)
 782:	7d02                	ld	s10,32(sp)
 784:	6de2                	ld	s11,24(sp)
 786:	6109                	addi	sp,sp,128
 788:	8082                	ret

000000000000078a <fprintf>:

void
fprintf(int fd, const char *fmt, ...)
{
 78a:	715d                	addi	sp,sp,-80
 78c:	ec06                	sd	ra,24(sp)
 78e:	e822                	sd	s0,16(sp)
 790:	1000                	addi	s0,sp,32
 792:	e010                	sd	a2,0(s0)
 794:	e414                	sd	a3,8(s0)
 796:	e818                	sd	a4,16(s0)
 798:	ec1c                	sd	a5,24(s0)
 79a:	03043023          	sd	a6,32(s0)
 79e:	03143423          	sd	a7,40(s0)
  va_list ap;

  va_start(ap, fmt);
 7a2:	fe843423          	sd	s0,-24(s0)
  vprintf(fd, fmt, ap);
 7a6:	8622                	mv	a2,s0
 7a8:	00000097          	auipc	ra,0x0
 7ac:	e04080e7          	jalr	-508(ra) # 5ac <vprintf>
}
 7b0:	60e2                	ld	ra,24(sp)
 7b2:	6442                	ld	s0,16(sp)
 7b4:	6161                	addi	sp,sp,80
 7b6:	8082                	ret

00000000000007b8 <printf>:

void
printf(const char *fmt, ...)
{
 7b8:	711d                	addi	sp,sp,-96
 7ba:	ec06                	sd	ra,24(sp)
 7bc:	e822                	sd	s0,16(sp)
 7be:	1000                	addi	s0,sp,32
 7c0:	e40c                	sd	a1,8(s0)
 7c2:	e810                	sd	a2,16(s0)
 7c4:	ec14                	sd	a3,24(s0)
 7c6:	f018                	sd	a4,32(s0)
 7c8:	f41c                	sd	a5,40(s0)
 7ca:	03043823          	sd	a6,48(s0)
 7ce:	03143c23          	sd	a7,56(s0)
  va_list ap;

  va_start(ap, fmt);
 7d2:	00840613          	addi	a2,s0,8
 7d6:	fec43423          	sd	a2,-24(s0)
  vprintf(1, fmt, ap);
 7da:	85aa                	mv	a1,a0
 7dc:	4505                	li	a0,1
 7de:	00000097          	auipc	ra,0x0
 7e2:	dce080e7          	jalr	-562(ra) # 5ac <vprintf>
}
 7e6:	60e2                	ld	ra,24(sp)
 7e8:	6442                	ld	s0,16(sp)
 7ea:	6125                	addi	sp,sp,96
 7ec:	8082                	ret

00000000000007ee <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 7ee:	1141                	addi	sp,sp,-16
 7f0:	e422                	sd	s0,8(sp)
 7f2:	0800                	addi	s0,sp,16
  Header *bp, *p;

  bp = (Header*)ap - 1;
 7f4:	ff050693          	addi	a3,a0,-16
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 7f8:	00000797          	auipc	a5,0x0
 7fc:	1c07b783          	ld	a5,448(a5) # 9b8 <freep>
 800:	a805                	j	830 <free+0x42>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
      break;
  if(bp + bp->s.size == p->s.ptr){
    bp->s.size += p->s.ptr->s.size;
 802:	4618                	lw	a4,8(a2)
 804:	9db9                	addw	a1,a1,a4
 806:	feb52c23          	sw	a1,-8(a0)
    bp->s.ptr = p->s.ptr->s.ptr;
 80a:	6398                	ld	a4,0(a5)
 80c:	6318                	ld	a4,0(a4)
 80e:	fee53823          	sd	a4,-16(a0)
 812:	a091                	j	856 <free+0x68>
  } else
    bp->s.ptr = p->s.ptr;
  if(p + p->s.size == bp){
    p->s.size += bp->s.size;
 814:	ff852703          	lw	a4,-8(a0)
 818:	9e39                	addw	a2,a2,a4
 81a:	c790                	sw	a2,8(a5)
    p->s.ptr = bp->s.ptr;
 81c:	ff053703          	ld	a4,-16(a0)
 820:	e398                	sd	a4,0(a5)
 822:	a099                	j	868 <free+0x7a>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 824:	6398                	ld	a4,0(a5)
 826:	00e7e463          	bltu	a5,a4,82e <free+0x40>
 82a:	00e6ea63          	bltu	a3,a4,83e <free+0x50>
{
 82e:	87ba                	mv	a5,a4
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 830:	fed7fae3          	bgeu	a5,a3,824 <free+0x36>
 834:	6398                	ld	a4,0(a5)
 836:	00e6e463          	bltu	a3,a4,83e <free+0x50>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 83a:	fee7eae3          	bltu	a5,a4,82e <free+0x40>
  if(bp + bp->s.size == p->s.ptr){
 83e:	ff852583          	lw	a1,-8(a0)
 842:	6390                	ld	a2,0(a5)
 844:	02059713          	slli	a4,a1,0x20
 848:	9301                	srli	a4,a4,0x20
 84a:	0712                	slli	a4,a4,0x4
 84c:	9736                	add	a4,a4,a3
 84e:	fae60ae3          	beq	a2,a4,802 <free+0x14>
    bp->s.ptr = p->s.ptr;
 852:	fec53823          	sd	a2,-16(a0)
  if(p + p->s.size == bp){
 856:	4790                	lw	a2,8(a5)
 858:	02061713          	slli	a4,a2,0x20
 85c:	9301                	srli	a4,a4,0x20
 85e:	0712                	slli	a4,a4,0x4
 860:	973e                	add	a4,a4,a5
 862:	fae689e3          	beq	a3,a4,814 <free+0x26>
  } else
    p->s.ptr = bp;
 866:	e394                	sd	a3,0(a5)
  freep = p;
 868:	00000717          	auipc	a4,0x0
 86c:	14f73823          	sd	a5,336(a4) # 9b8 <freep>
}
 870:	6422                	ld	s0,8(sp)
 872:	0141                	addi	sp,sp,16
 874:	8082                	ret

0000000000000876 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
 876:	7139                	addi	sp,sp,-64
 878:	fc06                	sd	ra,56(sp)
 87a:	f822                	sd	s0,48(sp)
 87c:	f426                	sd	s1,40(sp)
 87e:	f04a                	sd	s2,32(sp)
 880:	ec4e                	sd	s3,24(sp)
 882:	e852                	sd	s4,16(sp)
 884:	e456                	sd	s5,8(sp)
 886:	e05a                	sd	s6,0(sp)
 888:	0080                	addi	s0,sp,64
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 88a:	02051493          	slli	s1,a0,0x20
 88e:	9081                	srli	s1,s1,0x20
 890:	04bd                	addi	s1,s1,15
 892:	8091                	srli	s1,s1,0x4
 894:	0014899b          	addiw	s3,s1,1
 898:	0485                	addi	s1,s1,1
  if((prevp = freep) == 0){
 89a:	00000517          	auipc	a0,0x0
 89e:	11e53503          	ld	a0,286(a0) # 9b8 <freep>
 8a2:	c515                	beqz	a0,8ce <malloc+0x58>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 8a4:	611c                	ld	a5,0(a0)
    if(p->s.size >= nunits){
 8a6:	4798                	lw	a4,8(a5)
 8a8:	02977f63          	bgeu	a4,s1,8e6 <malloc+0x70>
 8ac:	8a4e                	mv	s4,s3
 8ae:	0009871b          	sext.w	a4,s3
 8b2:	6685                	lui	a3,0x1
 8b4:	00d77363          	bgeu	a4,a3,8ba <malloc+0x44>
 8b8:	6a05                	lui	s4,0x1
 8ba:	000a0b1b          	sext.w	s6,s4
  p = sbrk(nu * sizeof(Header));
 8be:	004a1a1b          	slliw	s4,s4,0x4
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
 8c2:	00000917          	auipc	s2,0x0
 8c6:	0f690913          	addi	s2,s2,246 # 9b8 <freep>
  if(p == (char*)-1)
 8ca:	5afd                	li	s5,-1
 8cc:	a88d                	j	93e <malloc+0xc8>
    base.s.ptr = freep = prevp = &base;
 8ce:	00000797          	auipc	a5,0x0
 8d2:	0f278793          	addi	a5,a5,242 # 9c0 <base>
 8d6:	00000717          	auipc	a4,0x0
 8da:	0ef73123          	sd	a5,226(a4) # 9b8 <freep>
 8de:	e39c                	sd	a5,0(a5)
    base.s.size = 0;
 8e0:	0007a423          	sw	zero,8(a5)
    if(p->s.size >= nunits){
 8e4:	b7e1                	j	8ac <malloc+0x36>
      if(p->s.size == nunits)
 8e6:	02e48b63          	beq	s1,a4,91c <malloc+0xa6>
        p->s.size -= nunits;
 8ea:	4137073b          	subw	a4,a4,s3
 8ee:	c798                	sw	a4,8(a5)
        p += p->s.size;
 8f0:	1702                	slli	a4,a4,0x20
 8f2:	9301                	srli	a4,a4,0x20
 8f4:	0712                	slli	a4,a4,0x4
 8f6:	97ba                	add	a5,a5,a4
        p->s.size = nunits;
 8f8:	0137a423          	sw	s3,8(a5)
      freep = prevp;
 8fc:	00000717          	auipc	a4,0x0
 900:	0aa73e23          	sd	a0,188(a4) # 9b8 <freep>
      return (void*)(p + 1);
 904:	01078513          	addi	a0,a5,16
      if((p = morecore(nunits)) == 0)
        return 0;
  }
}
 908:	70e2                	ld	ra,56(sp)
 90a:	7442                	ld	s0,48(sp)
 90c:	74a2                	ld	s1,40(sp)
 90e:	7902                	ld	s2,32(sp)
 910:	69e2                	ld	s3,24(sp)
 912:	6a42                	ld	s4,16(sp)
 914:	6aa2                	ld	s5,8(sp)
 916:	6b02                	ld	s6,0(sp)
 918:	6121                	addi	sp,sp,64
 91a:	8082                	ret
        prevp->s.ptr = p->s.ptr;
 91c:	6398                	ld	a4,0(a5)
 91e:	e118                	sd	a4,0(a0)
 920:	bff1                	j	8fc <malloc+0x86>
  hp->s.size = nu;
 922:	01652423          	sw	s6,8(a0)
  free((void*)(hp + 1));
 926:	0541                	addi	a0,a0,16
 928:	00000097          	auipc	ra,0x0
 92c:	ec6080e7          	jalr	-314(ra) # 7ee <free>
  return freep;
 930:	00093503          	ld	a0,0(s2)
      if((p = morecore(nunits)) == 0)
 934:	d971                	beqz	a0,908 <malloc+0x92>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 936:	611c                	ld	a5,0(a0)
    if(p->s.size >= nunits){
 938:	4798                	lw	a4,8(a5)
 93a:	fa9776e3          	bgeu	a4,s1,8e6 <malloc+0x70>
    if(p == freep)
 93e:	00093703          	ld	a4,0(s2)
 942:	853e                	mv	a0,a5
 944:	fef719e3          	bne	a4,a5,936 <malloc+0xc0>
  p = sbrk(nu * sizeof(Header));
 948:	8552                	mv	a0,s4
 94a:	00000097          	auipc	ra,0x0
 94e:	b7e080e7          	jalr	-1154(ra) # 4c8 <sbrk>
  if(p == (char*)-1)
 952:	fd5518e3          	bne	a0,s5,922 <malloc+0xac>
        return 0;
 956:	4501                	li	a0,0
 958:	bf45                	j	908 <malloc+0x92>
