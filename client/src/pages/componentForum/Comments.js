import React,{ useState ,useEffect } from 'react'
import {
    getComments as getCommentsApi,
    createComment as createCommentApi,
    updateComment as updateCommentApi,
    deleteComment as deleteCommentApi,
} from '../../api'
import Comment from "./Comment"
import CommentForm from "./CommentForm" 

const Comments =({ commentsUrl,currentUserId}) => {
    const [backendComments, setBackendComments] = useState([]);
    const [activeComment, setActiveComment] = useState(null);
    const rootComments = backendComments.filter(
      (backendComment) => backendComment.parentId === null
    );
    const getReplies = (commentId) =>
      backendComments
        .filter((backendComment) => backendComment.parentId === commentId)
        .sort(
          (a, b) =>
            new Date(a.createdAt).getTime() - new Date(b.createdAt).getTime()
        );
    const addComment = (text, parentId) => {
      createCommentApi(text, parentId).then((comment) => {
        setBackendComments([comment, ...backendComments]);  
        setActiveComment(null);
      });
    };
  
    const updateComment = (text, commentId) => {
      updateCommentApi(text).then(() => {
        const updatedBackendComments = backendComments.map((backendComment) => {
          if (backendComment.id === commentId) {
            return { ...backendComment, comment: text };
          }
          return backendComment;
        });
        setBackendComments(updatedBackendComments);
        setActiveComment(null);
      });
    };
    const deleteComment = (commentId) => {
      if (window.confirm("Are you sure you want to remove comment?")) {
        deleteCommentApi().then(() => {
          const updatedBackendComments = backendComments.filter(
            (backendComment) => backendComment.id !== commentId
          );
          setBackendComments(updatedBackendComments);
        });
      }
    };
  
    useEffect(() => {
      getCommentsApi().then((data) => {
        setBackendComments(data);
      });
    }, []);

    return (
        <div className="comments mt-2 w-5/6 mx-auto px-4">
        <h3 className="text-3xl mb-6">Comments</h3>
        <div className="ml-4">說點甚麼</div>
        <CommentForm submitLabel="Write" handleSubmit={addComment} />
        {/* <div className="comment-form-title">Write comment</div> */}
        <div className="comments-container">
        {rootComments.map((rootComment) => (
          <Comment
            key={rootComment.id}
            comment={rootComment}
            replies={getReplies(rootComment.id)}
            activeComment={activeComment}
            setActiveComment={setActiveComment}
            addComment={addComment}
            deleteComment={deleteComment}
            updateComment={updateComment}
            currentUserId={currentUserId}
          />
        ))}
      </div>
    </div>
    )
}

export default Comments
