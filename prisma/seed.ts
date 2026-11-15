import { PrismaClient, Role } from '@prisma/client'; import bcrypt from 'bcryptjs';
const db=new PrismaClient();
async function main(){const hash=await bcrypt.hash('ChangeMe123!',12); const school=await db.school.upsert({where:{code:'SL-LUB-001'},update:{},create:{name:'École Pilote SchoolLink',code:'SL-LUB-001'}}); await db.user.upsert({where:{email:'admin@schoollink.cd'},update:{},create:{email:'admin@schoollink.cd',passwordHash:hash,name:'Administrateur',role:Role.ADMIN,schoolId:school.id}}); console.log('Compte: admin@schoollink.cd / ChangeMe123!');}
main().finally(()=>db.$disconnect());
