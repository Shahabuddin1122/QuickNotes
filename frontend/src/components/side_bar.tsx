"use client"
import Image from "next/image";
import {useRouter} from "next/navigation";

const SideBar = ({highlight}:{highlight:number}) => {
    const router = useRouter();
    return (
        <>
            <div className="w-1/6 h-full border-r py-4 pr-2 ml-3 flex flex-col shadow-xl">
                <div>
                    <div className="w-full flex items-center gap-x-4 py-4">
                        <div className="w-[50px] h-[50px] border rounded-full overflow-hidden relative">
                            <Image src="/me3.png" alt="profile" objectFit="cover" fill/>
                        </div>
                        <div className="text-sm w-44">
                            <p className="truncate">Shahabuddin Akhon</p>
                            <p className="truncate">shahabuddin54@gmail.com</p>
                        </div>
                        <Image src="/notification.svg" alt="notification" width={20} height={20}/>
                    </div>
                    <div className="w-full h-[50px] border my-4 bg-gray-300 rounded-xl flex items-center">
                        <Image src="/search.svg" alt="search" width={40} height={40} className="px-2"/>
                        <input
                            className="w-full h-full rounded-r-xl px-2 bg-gray-300 text-black placeholder-black focus:outline-none"
                            placeholder="Search..."
                        />
                    </div>
                    <div className="w-full flex justify-center items-center gap-x-2 my-8">
                        <button
                            onClick={()=> router.push('/add-note')}
                            className="bg-green-400 w-4/5 py-2 px-8 rounded-lg flex justify-center items-center gap-x-2"
                        >
                            <Image src="note_add.svg" alt="edit" width={25} height={25}/>
                            Note
                        </button>
                        <button className="bg-gray-300 py-2 w-1/5 rounded-lg flex items-center justify-center">
                            <Image src="horizontal_dot.svg" alt="edit" width={25} height={25}/>
                        </button>
                    </div>
                    <div className="w-full">
                        <div
                            className={`w-full ${highlight==1 ? 'bg-gray-300' : ''} rounded-lg flex items-center gap-4 px-4 py-3 my-2 cursor-pointer`}
                            onClick={()=> router.push('/')}
                        >
                            <Image src="home.svg" alt="edit" width={25} height={25}/>
                            <p>Home</p>
                        </div>
                        <div
                            onClick={()=> router.push('/notes')}
                            className={`w-full ${highlight==2 ? 'bg-gray-300' : ''} rounded-lg flex items-center gap-4 px-4 py-3 cursor-pointer`}>
                            <Image src="note.svg" alt="edit" width={20} height={20}/>
                            <p>Notes</p>
                        </div>
                        <div
                            onClick={()=> router.push('/files')}
                            className={`w-full ${highlight==3 ? 'bg-gray-300' : ''} rounded-lg flex items-center gap-4 px-4 py-3 cursor-pointer`}>
                            <Image src="link.svg" alt="edit" width={25} height={25}/>
                            <p>Files</p>
                        </div>
                        <div
                            onClick={()=> router.push('/tasks')}
                            className={`w-full ${highlight==4 ? 'bg-gray-300' : ''} rounded-lg flex items-center gap-4 px-4 py-3 cursor-pointer`}>
                            <Image src="task.svg" alt="edit" width={25} height={25}/>
                            <p>Tasks</p>
                        </div>
                    </div>
                </div>
                <div className="mt-auto bg-gray-300 w-full h-12 flex items-center px-4 gap-x-4">
                    <Image src="logout.svg" alt="edit" width={25} height={25}/>
                    <p className="text-lg font-bold">Logout</p>
                </div>
            </div>
        </>
    )

}
export default SideBar;