"use client"
import Button from "@/components/Button";
import SideBar from "@/components/side_bar";
import Image_upload from "@/components/image_upload";
import Image from "next/image";
import {useEffect, useRef, useState} from "react";
import {useQuery} from "react-query";
import fetcher from "@/utils/fetcher";

const Page = ({params}) => {
    const id = params.id;
    const { data, isLoading, error } = useQuery(['individual-note', `http://localhost:8000/note/get-individual-note/${id}`], fetcher);
    const [isEditing, setIsEditing] = useState<boolean>(false);
    const [isEditing2, setIsEditing2] = useState<boolean>(false);
    const inputRef = useRef<HTMLInputElement | null>(null);

    useEffect(() => {
        if (isEditing && inputRef.current) {
            inputRef.current?.focus();
        }
    }, [isEditing]);

    return (
        <div className="w-full h-screen flex">
            <SideBar highlight={2} />
            <div className="w-5/6 h-full flex justify-center">
                <div className="w-11/12 py-8">
                    <div className="flex justify-between">
                        <div>
                            <p>Ready to start taking notes?</p>
                            <h1 className="text-2xl font-bold">Shahabuddin&apos;s note</h1>
                        </div>
                        <Button text="Share" />
                    </div>
                    <div className="py-4">
                        <div className="py-2">
                            <div className="w-1/2 flex justify-between items-center">
                                <p className="text-lg py-2 font-bold tracking-wide">Title</p>
                                <button onClick={() => setIsEditing((prevState) => !prevState)}>
                                    <Image src="/edit.svg" alt="edit" width={20} height={20}/>
                                </button>
                            </div>
                            <div className="w-1/2 py-4 px-4 rounded-lg border-black border">
                                {isEditing ? (
                                    <input
                                        type="text"
                                        value={"Property Listing"}
                                        ref={inputRef}
                                        className="w-full h-full font-semibold focus:outline-none"
                                    />
                                ) : (
                                    <p className="font-semibold">{data && data.title}</p>
                                )}
                            </div>
                        </div>
                        <div className="py-2">
                            <div className="w-1/2 flex justify-between items-center">
                                <p className="text-lg py-2 font-bold tracking-wide">Title</p>
                                <button onClick={() => setIsEditing2((prevState) => !prevState)}>
                                    <Image src="/edit.svg" alt="edit" width={20} height={20}/>
                                </button>
                            </div>
                            <div className="w-1/2 py-4 px-4 rounded-lg border-black border">
                                {isEditing2 ? (
                                    <textarea
                                        value={data && data.description}
                                        className="w-full h-full font-semibold focus:outline-none min-h-[300px]"
                                    />
                                ) : (
                                    <p className="font-semibold">{data && data.description}</p>
                                )}
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    );
};

export default Page;
