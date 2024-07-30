interface NoteImage {
    id: bigint;
    image: string;
}

interface Notes {
    id: bigint;
    title: string;
    description: string;
    favorite: boolean;
    attachments: NoteImage[];
    date:string,
    formatted_date:string,
}
interface addNotes {
    title: string;
    description: string;
}