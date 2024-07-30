"use client";
import { useEffect, useRef, useState } from "react";
import Image from "next/image";
import axios from "axios";

const InputBox = ({ value, Name, option,id }: { value: string, Name: string, option: boolean,id:bigint }) => {
    const inputRef = useRef<HTMLInputElement>(null);
    const textareaRef = useRef<HTMLTextAreaElement>(null);
    const [isEditing, setIsEditing] = useState<boolean>(false);
    const [UserNewData, setUserNewData] = useState<string>(value);

    useEffect(() => {
        if (isEditing) {
            if (option && textareaRef.current) {
                textareaRef.current.focus();
            } else if (!option && inputRef.current) {
                inputRef.current.focus();
            }
        } else {
            // Update UserNewData with the initial value when editing starts
            setUserNewData(value);
        }
    }, [isEditing, option, value]);

    const handleSave = async  () => {
        setIsEditing(false);
        if (UserNewData) {
            const name = Name.toLowerCase();
            const data = {
                [name]: UserNewData
            }
            const response = axios.put(`http://localhost:8000/note/update-notes/${id}`,data)
            setUserNewData(UserNewData)
        }

    }

    return (
        <div className="py-2">
            <div className="w-1/2 flex justify-between items-center">
                <p className="text-lg py-2 font-bold tracking-wide">{Name}</p>
                <button>
                    {isEditing? <Image
                        src={"/save.svg"}
                        alt={"save"}
                        width={20}
                        height={20}
                        onClick={handleSave}
                    /> : <Image
                        src={"/edit.svg"}
                        alt={"edit"}
                        width={20}
                        height={20}
                        onClick={() => setIsEditing((prevState) => !prevState)}
                    />}
                </button>
            </div>
            <div className="w-1/2 py-4 px-4 rounded-lg border border-black">
                {isEditing ? (
                    option ? (
                        <textarea
                            name={Name}
                            value={UserNewData}
                            onChange={(e) => setUserNewData(e.target.value)}
                            ref={textareaRef}
                            className="w-full h-full font-semibold focus:outline-none min-h-[300px]"
                        />
                    ) : (
                        <input
                            type="text"
                            name={Name}
                            value={UserNewData}
                            onChange={(e) => setUserNewData(e.target.value)}
                            ref={inputRef}
                            className="w-full h-full font-semibold focus:outline-none"
                        />
                    )
                ) : (
                    <p className="font-semibold">{UserNewData}</p>
                )}
            </div>
        </div>
    );
};

export default InputBox;
