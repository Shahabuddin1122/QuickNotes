"use client";
import Image from "next/image";
import { useRouter } from "next/navigation";
import { useState, useRef, useEffect } from "react";
import EditModal from "@/components/editModal";
import axios from "axios";

const Note_card = ({ title, description, favorite, attachments, date, url }) => {
    const [editModal, setEditModal] = useState<boolean>(false);
    const router = useRouter();
    const modalRef = useRef<HTMLDivElement>(null);
    const deleteNote =  async ()=>{
        const response = axios.delete(`http://localhost:8000/note/delete-note/${url}`)
        setEditModal(false)
    }
    const addFavorites = async ()=> {
        const response = axios.put(`http://localhost:8000/note/update-notes/${url}`,{"favorite":!favorite})
        setEditModal(false)
    }

    const truncateDescription = (text) => {
        if (text.length > 200) {
            return text.slice(0, 200) + "...";
        }
        return text;
    };

    const toggleEditModal = (e) => {
        e.stopPropagation();
        setEditModal((prevState) => !prevState);
    };

    const closeEditModal = (e) => {
        if (modalRef.current && !modalRef.current.contains(e.target)) {
            setEditModal(false);
        }
    };

    useEffect(() => {
        if (editModal) {
            document.addEventListener("click", closeEditModal);
        } else {
            document.removeEventListener("click", closeEditModal);
        }
        return () => {
            document.removeEventListener("click", closeEditModal);
        };
    }, [editModal]);

    return (
        <>
            <div className={`w-1/5 border ${favorite? 'bg-amber-100':'bg-white'} p-4 shadow-xl flex flex-col cursor-pointer relative`}>
                <div className="flex-grow">
                    <div className="flex justify-between relative">
                        <h1 className="font-bold text-xl">{title}</h1>
                        <div className="relative">
                            <Image
                                src="/vertical_dots.svg"
                                alt="edit"
                                onClick={toggleEditModal}
                                height={8}
                                width={8}
                                className="cursor-pointer"
                            />
                            {editModal && (
                                <div ref={modalRef}>
                                    <EditModal deleteModal={deleteNote} addToFav={addFavorites} isFav={favorite} />
                                </div>
                            )}
                        </div>
                    </div>
                    <div className="py-2" onClick={() => router.push(`/note/${url}`)}>
                        <p>{truncateDescription(description)}</p>
                    </div>
                </div>
                <div className="pt-6 flex justify-between" onClick={() => router.push(`/note/${url}`)}>
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