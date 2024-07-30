"use client"
import Button from "@/components/Button";
import SideBar from "@/components/side_bar";
import {useEffect, useRef, useState} from "react";
import {useQuery} from "react-query";
import fetcher from "@/utils/fetcher";
import InputBox from "@/components/InputBox";

const Page = ({params}) => {
    const id = params.id;
    const { data, isLoading, error } = useQuery(['individual-note', `http://localhost:8000/note/get-individual-note/${id}`], fetcher,{
        staleTime: 1000,
        cacheTime: 1000 * 60 * 5,
        refetchOnWindowFocus: true,
        refetchInterval: 1000,
        refetchOnReconnect: true
    });
    const [noteData,setNoteData] = useState<addNotes>()
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
                        <InputBox value={data && data.title} Name={"Title"} option={false} id={id}/>
                        <InputBox value={data && data.description} Name={"Description"} option={true} id={id} />
                        {
                            data && data?.attachments[0]?.image && <div className="py-2">
                                <p className="text-lg py-2 font-bold tracking-wide">Attachment</p>
                                <div
                                    className="w-2/5 border border-black rounded-lg flex justify-center items-center cursor-pointer">
                                    <img
                                        src={`data:image/jpeg;base64,${data && data?.attachments[0]?.image}`}
                                        alt="Uploaded"
                                        className="object-contain h-full w-full rounded-lg"
                                    />
                                </div>
                            </div>
                        }
                    </div>
                </div>
            </div>
        </div>
    );
};

export default Page;
