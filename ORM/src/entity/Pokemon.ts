import { Entity, Column, ManyToMany, JoinTable, PrimaryGeneratedColumn } from 'typeorm';
import { Permission } from './auth/Permission';
import { Profile } from './auth/Profile';

@Entity()
export class Pokemon {

    @PrimaryGeneratedColumn('uuid')
    id: string;

    @Column()
    name: string

    @Column()
    description: string

    @ManyToMany(() => Profile, (profile) => profile.pokemon)
    @JoinTable()
    profiles: Profile[]


}




