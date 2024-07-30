"use client"
import Image from "next/image";
import {useRouter} from "next/navigation";

const Note_card = ({ title, description, favorite, attachments,date,url}) => {
    const router = useRouter()
    const truncateDescription = (text) => {
        if (text.length > 200) {
            return text.slice(0, 200) + "...";
        }
        return text;
    };

    return (
        <>
            <div className="w-1/5 border bg-amber-100 p-4 shadow-xl flex flex-col cursor-pointer" onClick={()=> router.push(`/note/${url}`)}>
                <div className="flex-grow">
                    <div className="flex justify-between">
                        <h1 className="font-bold text-xl">{title}</h1>
                        <Image src="/vertical_dots.svg" alt="edit" height={5} width={5} />
                    </div>
                    <div className="py-2">
                        <p>{truncateDescription(description)}</p>
                    </div>
                </div>
                <div className="pt-6 flex justify-between">
                    <p className="text-gray-500">{date}</p>
                    <div className="flex items-center gap-6">
                        <Image src="/users.svg" alt="edit" height={20} width={20} />
                        {favorite && <Image src="/star.svg" alt="favorite" height={20} width={20} />}
                    </div>
                </div>
            </div>
        </>
    );
};

export default Note_card;
